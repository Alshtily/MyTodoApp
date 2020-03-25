//
//  ViewController.swift
//  MyTodoApp
//
//  Created by saad on 3/24/20.
//  Copyright © 2020 MyTodoApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBAction func Button(_ sender: Any) {
        let TodoAlert = UIAlertController(title: "Add New", message: "Add New ToDo List", preferredStyle: .alert)
        TodoAlert.addTextField()
        let Action = UIAlertAction(title: "Add", style: .default) { (AlerAction) in
            let NewTodo = TodoAlert.textFields![0]
            self.ToDoList.append(NewTodo.text!)
            self.TableView.reloadData()
        }
        
        TodoAlert.addAction(Action)
        
        let Cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        TodoAlert.addAction(Cancel)
        
        present(TodoAlert, animated: true , completion: nil)
    }
    
    
    
    var ToDoList : [String?] = []
    
    
    @IBOutlet weak var TableView: UITableView! {
        didSet {
            TableView.delegate = self
            TableView.dataSource = self
            
            
            TableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        
        Cell.label.text = ToDoList[indexPath.row]
        return Cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Cell = TableView.cellForRow(at: indexPath) as! TableViewCell
        
        if Cell.isChacked == 0 {
            Cell.ChackedImage.image = #imageLiteral(resourceName: "chacked")
            Cell.isChacked = 1
        } else if Cell.isChacked == 1  {
            Cell.ChackedImage.image = #imageLiteral(resourceName: "Uncheckedx")
             Cell.isChacked = 2
        } else if Cell.isChacked == 2 {
            Cell.ChackedImage.image = #imageLiteral(resourceName: "unchecked")
             Cell.isChacked = 0
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ToDoList.remove(at: indexPath.row)
            TableView.reloadData()
        }
    }
    

    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

