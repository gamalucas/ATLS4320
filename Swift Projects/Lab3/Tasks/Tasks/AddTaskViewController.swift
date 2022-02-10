//
//  AddTaskViewController.swift
//  Tasks
//
//  Created by LUCAS GAMA on 2/9/22.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var addTaskTextField: UITextField!
    var newTask = String()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "saveSegue"{
            if addTaskTextField.text?.isEmpty == false {
                newTask = addTaskTextField.text!
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
