//  Microsoft Mobile Coaching
//
//  Created by Alex Jiang on 7/3/18.
//  Copyright © 2018 Alex Jiang. All rights reserved.


import Foundation


// MARK: - Array Element

// Not favour of [] index based
let array1 = [1, 2, 3]
type(of: array1[0])  // not Int?

// Favour of no index visiting
array1.forEach { debugPrint($0) }
let idx = array1.index { $0 == 3 } // Optional index
array1.filter { $0 % 2 == 0 }

// popLast safe (high level)
// removeLast not safe (low level)
