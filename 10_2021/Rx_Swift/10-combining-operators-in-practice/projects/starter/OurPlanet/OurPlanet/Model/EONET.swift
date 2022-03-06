/// Copyright (c) 2020 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Foundation
import RxSwift
import RxCocoa

class EONET {
  static let API = "https://eonet.sci.gsfc.nasa.gov/api/v2.1"
  static let categoriesEndpoint = "/categories"
  static let eventsEndpoint = "/events"

  // The categories observable you created is a singleton (static var).
  // All subscribers will get the same one
  static var categories: Observable<[EOCategory]> = {
    let request: Observable<[EOCategory]> = EONET.request(endPoint: categoriesEndpoint,
                                                          contentIdentifier: "categories")

    return request
      .map { categories in categories.sorted { $0.name < $1.name } }
      .catchErrorJustReturn([])
      .share(replay: 1, scope: .forever)
  }()

  static func jsonDecoder(contentIdentifier: String) -> JSONDecoder {
    let decoder = JSONDecoder()
    decoder.userInfo[.contentIdentifier] = contentIdentifier
    decoder.dateDecodingStrategy = .iso8601
    return decoder
  }

  static func filteredEvents(events: [EOEvent], forCategory category: EOCategory) -> [EOEvent] {
    return events.filter { event in
      return event.categories.contains(where: { $0.id == category.id }) && !category.events.contains {
        $0.id == event.id
      }
      }
      .sorted(by: EOEvent.compareDates)
  }


  // MARK: - Request
  static func request<T: Decodable>(endPoint: String,
                                    query: [String: Any] = [:],
                                    contentIdentifier: String) ->
  Observable<T> {
    do {
      guard let url = URL(string: API)?.appendingPathComponent(endPoint),
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
        throw EOError.invalidURL(endPoint)
      }
      components.queryItems = try query.compactMap({ (key, value) in
        guard let v = value as? CustomStringConvertible else {
          throw EOError.invalidParameter(key, value)
        }
        return URLQueryItem(name: key, value: v.description)
      })
      guard let finalURL = components.url else {
        throw EOError.invalidURL(endPoint)
      }
      let request = URLRequest(url: finalURL)

      return URLSession.shared.rx.response(request: request)
        .map { (result: (response: HTTPURLResponse, data: Data)) -> T in
          let decoder = self.jsonDecoder(contentIdentifier: contentIdentifier)
          let envelope = try decoder.decode(EOEnvelope<T>.self, from: result.data)
          return envelope.content
        }
    } catch {
      return Observable.empty()
    }
  }


}