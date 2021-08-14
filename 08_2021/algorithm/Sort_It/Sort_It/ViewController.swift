//
//  ViewController.swift
//  Sort_It
//
//  Created by Alex Jiang on 14/8/21.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let array = [7, 2, 6, 3, 9]
    print("Original: \(array)")
    print("Merge sorted: \(mergeSort(array))")
  }
}

