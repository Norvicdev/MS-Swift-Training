import UIKit
import RxSwift
import RxCocoa

class CategoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet var tableView: UITableView!

  let categories = BehaviorRelay<[EOCategory]>(value: [])
  let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()

    self.categories
      .asObservable()
      .subscribe(onNext: { [weak self] _ in
        DispatchQueue.main.async {
          self?.tableView.reloadData()
        }
      })
      .disposed(by: self.disposeBag)

    self.startDownload()
  }

  func startDownload() {
    let eoCategories = EONET.categories
    eoCategories
      .bind(to: self.categories)
      .disposed(by: self.disposeBag)
  }
  
  // MARK: UITableViewDataSource
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.categories.value.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell")!

    let category = self.categories.value[indexPath.row]
    cell.textLabel?.text = category.name
    cell.detailTextLabel?.text = category.description

    return cell
  }
  
}
