//: Playground - noun: a place where people can play

import Foundation


// MARK: - OC Way

// + (BOOL)checkTemperature: (NSError **)error


// MARK: - Use NSError in Swift

// In x.h
// NS_ERROR_ENUM(NSInteger, CarSensorError, carSensorErrorDomain) {
//    overHeat = 100
//};

//do {
//    try car.selfCheck()
//} catch let error as CarSensorError {
//    print(error._domain)
//    print(error.errorCode)
//    print(error.userInfo["NSLocalizedDescription"] ?? "")
//}


// MARK: - LocalizedError

//protocol LocalizedError : Error {
//    /// A localized message describing what error occurred.
//    var errorDescription: String? { get }
//
//    /// A localized message describing the reason for the failure.
//    var failureReason: String? { get }
//
//    /// A localized message describing how one might recover from the failure.
//    var recoverySuggestion: String? { get }
//
//    /// A localized message providing "help" text if the user requests help.
//    var helpAnchor: String? { get }
//}

// it has default implementaion nil

enum CarError: LocalizedError {
    case outOfFuel
}

extension CarError {
    var recoverySuggestion: String? {
        return "Switch to e-power mode"
    }
}


// MAR: - Custom Error

extension CarError: CustomNSError {
    static let errorDomain = "CarErrorDomain"

    var errorCode: Int {
        switch self {
        case .outOfFuel:
            return -100
        }
    }

    var errorUserInfo: [String: Any] {
        switch self {
        case .outOfFuel:
            return [
                "LocalizedDescription":
                "U r running out of fuel"
            ]
        }
    }
}
