//
//  TodoListViewAlert.swift
//  ToDoDemo
//
//  Created by Alex Jiang on 9/4/18.
//  Copyright © 2018 Junliang Jiang. All rights reserved.
//

import UIKit


extension TodoListViewController {
    typealias AlertCallback =  ((UIAlertAction) -> Void)
    
    func flash(title: String, message: String, callback: AlertCallback? = nil) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(
            title: "OK",
            style: UIAlertActionStyle.default,
            handler: callback)
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
