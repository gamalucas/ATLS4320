//
//  TasksTableViewController.swift
//  Tasks
//
//  Created by LUCAS GAMA on 2/9/22.
//

import UIKit

class TasksTableViewController: UITableViewController {
    
    var allData = TasksDataLoader()
    var selectedTask = 0
    var taskList = [String]()
    var searchController = UISearchController()

    override func viewDidLoad() {
        super.viewDidLoad()
        taskList = allData.getTask(idx: selectedTask)
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //search results
        let resultsController = SearchResultsTableViewController()
        resultsController.allWords = taskList
        searchController =  UISearchController(searchResultsController: resultsController)
        
        searchController.searchBar.placeholder = "Enter a search item"
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView =  searchController.searchBar
        searchController.searchResultsUpdater =  resultsController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        taskList = allData.getTask(idx: selectedTask)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tasksCell", for: indexPath)

        // Configure the cell...
        var cellConfig = cell.defaultContentConfiguration()
        cellConfig.text = taskList[indexPath.row]
        cell.contentConfiguration = cellConfig

        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            taskList.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            allData.deleteTask(idx: selectedTask, position: indexPath.row)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){
        if segue.identifier == "saveSegue"{
            if let source = segue.source as? AddTaskViewController{
                if source.newTask.isEmpty == false {
                    allData.addTask(idx: selectedTask, newTask: source.newTask, position: taskList.count)
                    taskList.append(source.newTask)
                    tableView.reloadData()
                }
            }
        }
    }

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
