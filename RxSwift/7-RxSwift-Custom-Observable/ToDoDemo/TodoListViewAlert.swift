//
//  TodoListViewAlert.swift
//  ToDoDemo
//
//  Created by Alex Jiang on 6/4/18.
//  Copyright © 2018 Junliang Jiang. All rights reserved.
//

import UIKit


extension TodoListViewController {
    func flash(title: String, message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(
            title: "OK",
            style: UIAlertActionStyle.default)
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
