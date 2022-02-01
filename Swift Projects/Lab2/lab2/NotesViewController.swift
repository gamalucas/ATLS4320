//
//  NotesViewController.swift
//  lab2
//
//  Created by LUCAS GAMA on 1/31/22.
//

import UIKit

class NotesViewController: UIViewController {

    @IBAction func openAppButton(_ sender: UIButton) {
        //https://www.ioscreator.com/tutorials/display-date-date-picker-ios-tutorial - tutorial for date picker
        if(UIApplication.shared.canOpenURL(URL(string: "fb://")!)){
            UIApplication.shared.open(URL(string: "fb://")!, options: [:], completionHandler: nil)
        }
        else{
            UIApplication.shared.open(URL(string: "http://www.facebook.com")!, options: [:], completionHandler: nil)
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
