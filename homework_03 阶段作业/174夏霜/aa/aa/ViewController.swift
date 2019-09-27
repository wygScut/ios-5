//
//  ViewController.swift
//  aa
//
//  Created by Apple on 2019/9/10.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBOutlet weak var hintLabe: UILabel!
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBAction func login(_ sender: Any) {
        if((id.text == "Spring") && (pass.text == "123"))
        {
            hintLabe.isHidden = false
            hintLabe.text = "Yes!"
        }
        else
        {
            hintLabe.isHidden = false
            hintLabe.text = "WRONG!"
        }
    }
}
