//: Playground - noun: a place where people can play

import RxSwift


// MARK: - Publish Subject

// Subject is both observer and observable

let publishSubject = PublishSubject<String>()

// as observer, "collecting" / "emit event"
// An observer is someone who watches or pays attention to something
// — if you're an observer of current events, you probably watch the news
// and read the newspaper every day to keep up with what's going on.
publishSubject.onNext("publish section 4.1")

// as observable, subscribe
let sub1 = publishSubject.subscribe(onNext: {
    debugPrint("sub1 - \($0)")
})

// nothing print out ?
// it only subscribes to the event happens after subscription

publishSubject.onNext("publish another section 4.1")

sub1.dispose()


// MARK: - Behavior Subject

let behaviorSubject = BehaviorSubject<String>(value: "section 4.2")
let sub2 = behaviorSubject.subscribe(onNext: {
    debugPrint("sub2 - \($0)")
})
behaviorSubject.onNext("section 4.2 continue")

// will receive the last missed event

let sub2_2 = behaviorSubject.subscribe(onNext: {
    debugPrint("sub2.2 - \($0)")
})

sub2.dispose()
sub2_2.dispose()


// MARK: - Replay Subject

let replaySubject = ReplaySubject<String>.create(bufferSize: 2)

let sub3 = replaySubject.subscribe(onNext: {
    debugPrint("sub3 - \($0)")
})

replaySubject.onNext("section 4.3")
replaySubject.onNext("section 4.3 continue")
replaySubject.onNext("section 4.3 finish")

// will receive the last n event specified by buffersize

let sub3_2 = replaySubject.subscribe(onNext: {
    debugPrint("sub3_2 - \($0)")
})


// MARK: - Variable

// imitate the variable in swift, with observable ability

let stringVariable = Variable("String Variable")

let sub4 = stringVariable.asObservable().subscribe(onNext: { debugPrint("sub4 - \($0)")})

stringVariable.value = "reassign variable value"

// no .Error event
// no need to send .complete
// it's just a variable
