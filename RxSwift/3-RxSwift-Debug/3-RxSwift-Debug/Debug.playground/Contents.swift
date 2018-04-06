//: Playground - noun: a place where people can play

import RxSwift


// MARK: - Create Observable

//public static func create(
//    _ subscribe: @escaping (AnyObserver<E>) -> Disposable
//    ) -> Observable<E>

// subscribe is not meant to be subscribe to something
// it lets you defines how to emit event to subscribers

let customOb = Observable<Int>.create { _ in
    // define event emitter here
    return Disposables.create()
}

enum TestError: Error {
    case unknown
}

let customOb2 = Observable<Int>.create { observer in
    observer.onNext(2)
    observer.onNext(4)
    observer.onError(TestError.unknown)
    observer.onCompleted()

    return Disposables.create()
}

// to use this observable

let bag = DisposeBag()


customOb2.subscribe (
    onNext: { debugPrint($0) },
    onError: { debugPrint($0) },
    onCompleted: { debugPrint("Completed") },
    onDisposed: { debugPrint("Disposed") }
).disposed(by: bag)


// MARK: - Debug

customOb2
    .debug()
    .subscribe(
        onNext: { debugPrint($0)},
        onError: { debugPrint($0) })
    .disposed(by: bag)
