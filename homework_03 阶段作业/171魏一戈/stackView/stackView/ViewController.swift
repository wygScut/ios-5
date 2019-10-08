//
//  ViewController.swift
//  stackView
//
//  Created by 魏一戈 on 2019/10/8.
//  Copyright © 2019年 魏一戈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var phoneNumber: UITextField!
    
    @IBOutlet weak var ans: UILabel!
    @IBAction func check(_ sender: Any) {
        if((name.text == "Tom")&&(phoneNumber.text == "123")){
            ans.isHidden = false
            ans.text = "姓名和电话匹配正确"
        }
        else{
            ans.isHidden = false
            ans.text = "姓名和电话匹配不正确"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

