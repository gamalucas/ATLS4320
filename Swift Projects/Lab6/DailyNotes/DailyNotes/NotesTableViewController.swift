//
//  NotesTableViewController.swift
//  DailyNotes
//
//  Created by LUCAS GAMA on 3/28/22.
//

import UIKit

class NotesTableViewController: UITableViewController {
    
    var notesData = NotesDataHandler()
    var notesList = [Notes]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        notesData.dbSetup()
        notesList = notesData.getNotes()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func render(){
        notesList =  notesData.getNotes()
        tableView.reloadData()
    }
    @IBAction func addNoteItem(_ sender: Any) {
        let addAlert = UIAlertController(title: "New note", message: "Add up to three words that describes your day today", preferredStyle: .alert)
        addAlert.addTextField(configurationHandler: {(UITextField) in })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        addAlert.addAction(cancelAction)
        let addItemAction = UIAlertAction(title: "Add", style: .default, handler:
            {(UIAlertAction)in

            //data formarter code from: https://stackoverflow.com/questions/42524651/convert-nsdate-to-string-in-ios-swift
            let formatter = DateFormatter()
            // initially set the format based on your datepicker date / server String
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let myString = formatter.string(from: Date()) // string purpose I add here
            // convert your string to date
            let yourDate = formatter.date(from: myString)
            //then again set the date format whhich type of output you need
            formatter.dateFormat = "dd-MMM-yyyy"
            // again convert your date to string
            let myStringDate = formatter.string(from: yourDate!)
            print("Today's date: ", myStringDate)
            
            let newItem = addAlert.textFields![0]
            let newNoteItem = Notes()
            newNoteItem.note = newItem.text!
            newNoteItem.date = myStringDate
            self.notesData.addNote(newNote: newNoteItem)
            self.render()
        })
        addAlert.addAction(addItemAction)
        present(addAlert, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notesList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        var cellConfig = cell.defaultContentConfiguration()
        let item = notesList[indexPath.row]
        cellConfig.text = item.note
        cellConfig.secondaryText = item.date
        cell.contentConfiguration = cellConfig

        return cell
    }

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
