//
//  ViewController.swift
//  TodoDemo
//
//  Created by Alex Jiang on 6/4/18.
//  Copyright © 2018 Junliang Jiang. All rights reserved.
//

import UIKit
import RxSwift


class TodoListViewController: UIViewController {
    var todoItems = Variable<[TodoItem]>([])
    let bag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var clearTodoBtn: UIButton!
    @IBOutlet weak var addTodo: UIBarButtonItem!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadTodoItems()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self

        todoItems.asObservable().subscribe(onNext: {
            [weak self] todos in self?.updateUI(todos: todos)
        }).addDisposableTo(bag)
    }

    func updateUI(todos: [TodoItem]) {
        tableView.reloadData()
    }

    @IBAction func addTodoItem(_ sender: Any) {
        let todoItem = TodoItem(name: "Todo Demo", isFinished: false)
        todoItems.value.append(todoItem)
    }
    
    @IBAction func saveTodoList(_ sender: Any) {
        saveTodoItems()
    }
    
    @IBAction func clearTodoList(_ sender: Any) {
        todoItems.value.removeAll()
    }
}
