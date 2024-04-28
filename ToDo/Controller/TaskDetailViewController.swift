//
//  TaskDetailViewController.swift
//  ToDo
//
//  Created by Rafael González on 20/04/24.
//

import UIKit

class TaskDetailViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var detailTask : TDTask?
    
    
    @IBOutlet weak var taskTitle: UITextField!
    
    @IBOutlet weak var taskDate: UIDatePicker!
    
    @IBOutlet weak var taskNotes: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if detailTask != nil {
            taskTitle.text = detailTask?.title
            taskDate.date = (detailTask?.date)!
            taskNotes.text = detailTask?.notes
        }
    }
    

    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        
        let isModal = self.presentingViewController is UINavigationController
                print("isModal: ",isModal)
                if isModal {
                    self.dismiss(animated: true)
                }
                else{
                    navigationController?.popViewController(animated: true)
                }
    }
    
    
    
    // MARK: - Table view data source

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ToDoListViewController
        
        if detailTask == nil{
            detailTask = TDTask(context: context)
        }
        detailTask?.title = taskTitle.text
        detailTask?.date = taskDate.date
        detailTask?.notes = taskNotes.text
        destination.currentTask = detailTask
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        var perform = false
        
        if let title = taskTitle.text {
            if title.isEmpty {
                self.show(warning: "¡No capturaste el título!")
            }
            else {
                perform = true
            }
        }
        return perform
    }
}
