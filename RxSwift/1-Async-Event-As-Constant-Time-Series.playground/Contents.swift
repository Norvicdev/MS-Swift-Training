//
//  Miscrosoft Mobile Team Training
//
//  Created by Junliang Jiang on 25/3/18.
//  Copyright © 2018 Junliang Jiang. All rights reserved.
//

import UIKit


// MARK: - Filter for a constant array

let stringArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

let result1 = stringArray
    .flatMap { Int($0) }
    .filter { $0 % 2 == 0 }

// stringArray: as immutable series of input
// flatmap, filter: as event
// flatmap, filter closure: as implementation in event


// MARK: - Filter for a series of user input

// we should have the same logic above, however...
// it looks totally different..

final class ViewController: UIViewController {}

extension ViewController: UITextFieldDelegate {
    public func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String) -> Bool {
        // 1. Map input to Int
        if let n = Int(string) {
            // 2. Filter out the even number
            if n % 2 == 0 {
                print("Even: \(n)")
            }
        }

        return true
    }
}

// how to relate UI logic to a time series input ?
