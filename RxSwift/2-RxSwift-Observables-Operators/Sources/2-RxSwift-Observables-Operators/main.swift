import RxSwift
import Foundation


// MARK: - Observable as a time series immutable data


Observable.of("1", "2", "3", "4", "5", "6", "7", "8", "9")
Observable.from(["1", "2", "3", "4", "5", "6", "7", "8", "9"])

_ = Observable.of("1", "2", "3", "4", "5", "6", "7", "8", "9")
    .map { Int($0) }
    .filter { $0 != nil && $0! % 2 == 0 }


// MARK: - Every element is async event

_ = Observable.of("1", "2", "3", "4", "5", "6", "7", "8", "9")
    .map { Int($0) }
    .filter {
        if let item = $0, item % 2 == 0 {
            debugPrint("Even: \(item)")
            return true
        }

        return false
}


// MARK: - Event emit on Subscribe (Cold Observable)

// Observable emit event, subscribe to get notified

var evenNumberObservable =
    Observable.of("1", "2", "3", "4", "5", "6", "7", "8", "9")
        .map { Int($0) }
        .filter {
            if let item = $0, item % 2 == 0 {
                debugPrint("Even: \(item)")
                return true
            }

            return false
}

evenNumberObservable.subscribe { event in
    debugPrint("Event: \(event)")
}


// MARK: - Observable need to be disposable

var bag = DisposeBag()

_ = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
    .subscribe(
        onNext: { debugPrint("Subscribed: \($0)") },
        onDisposed: { debugPrint("The queue was disposed.") })
    .disposed(by: bag)


