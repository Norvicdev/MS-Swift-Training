//: Playground - noun: a place where people can play

import Foundation

// MARK: - Nil v.s. Error

// If error type is more than one, use Error !


// MARK: - Error as Protocol

enum Result<T> {
    case success(T)
    case failure(Error)
}

struct Car {
    var fuelInLitre: Double

    func start() -> Result<String> {
        guard fuelInLitre > 5 else {
            // how to express error ?
            return .failure(CarError.outOfFuel)
        }
        return .success("GO")
    }
}

enum CarError: Error {
    case outOfFuel
}


// MARK: - Usage

let car = Car(fuelInLitre: 3)

switch car.start() {
case let .success(message):
    debugPrint(message)
case let .failure(error):
    if let carError = error as? CarError, carError == .outOfFuel {
        debugPrint("fail to start due to out of fuel")
    } else {
        debugPrint(error.localizedDescription)
    }
}

// MARK: - Better

// Result is good, however it introduces unecessary wrap for your return type
// it adds one more layers betweeen your input and your outpurt

// use throws

struct AnotherCar {
    var fuelInLitre: Double

    func start() throws -> String {
        guard fuelInLitre > 5 else {
            throw CarError.outOfFuel
        }
        return "GO"
    }
}

let anotherCar = AnotherCar(fuelInLitre: 1)
do {
    let message = try anotherCar.start()
    debugPrint(message)
} catch CarError.outOfFuel {
    debugPrint("Cannot start due to out of fuel")
} catch {
    debugPrint("We have something wrong")
}
