//
//  ViewController.swift
//  ToDo
//
//  Created by Rafael Gonzalez on 23/09/23.
//

import UIKit

class ToDoListViewController : UIViewController {
   
    @IBOutlet weak var toDoListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        toDoListTableView.dataSource = self
        toDoListTableView.delegate = self
    }

}

extension ToDoListViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //perform segue when user touchs a cell
        performSegue(withIdentifier: "showTaskSegue", sender: self)
    }
    
}
