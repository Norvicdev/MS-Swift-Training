//  Microsoft Mobile Coaching
//
//  Created by Alex Jiang on 7/3/18.
//  Copyright © 2018 Alex Jiang. All rights reserved.


import Foundation

// MARK: - Copy On Write in Swift Array
var array1 = [1, 2, 3]
let copyArray1 = array1

func getBufferAddress<T>(of array: [T]) -> String {
    return array.withUnsafeBufferPointer { buffer in
        return String(describing: buffer.baseAddress)
    }
}

// Before write
getBufferAddress(of: array1)
getBufferAddress(of: copyArray1)

array1.append(4)

// After write
getBufferAddress(of: array1)
getBufferAddress(of: copyArray1)


// MARK: Copy by Reference of Array Type
let array2 = NSMutableArray(array: [1, 2, 3])
let copyArray2: NSArray = array2
let deepCopyArray2 = array2.copy() as! NSArray

array2.insert(0, at: 0)
copyArray2
deepCopyArray2
