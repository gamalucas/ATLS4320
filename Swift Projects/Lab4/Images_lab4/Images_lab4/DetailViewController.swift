//
//  DetailViewController.swift
//  Images_lab4
//
//  Created by LUCAS GAMA on 2/21/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgApe: UIImageView!
    
    var apeName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let imgName =  apeName {
            imgApe.image = UIImage(named: imgName)
        }
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
