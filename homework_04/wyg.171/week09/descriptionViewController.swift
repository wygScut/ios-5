//
//  descriptionViewController.swift
//  week09
//
//  Created by Apple on 2019/10/22.
//  Copyright © 2019 wyg. All rights reserved.
//

import UIKit

class descriptionViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var descriptionText: UITextField!
    var foodForEdit : food?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameText.text = foodForEdit?.foodName
        self.descriptionText.text = foodForEdit?.foodDescription
        self.navigationItem.title = foodForEdit?.foodName
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "saveToList" {
            print("save")
            foodForEdit=food(name: self.nameText.text!,foodDescription: self.descriptionText.text!)
        }
        if segue.identifier == "cancelToList" {
            print("cancel")
        }
    }

}
