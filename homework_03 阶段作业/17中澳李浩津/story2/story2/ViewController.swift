//
//  ViewController.swift
//  story2
//
//  Created by Apple on 2019/9/17.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //先把welcome的文本设置为隐藏
        self.welcome_text.isHidden = true
        
        
    }
    
    @IBOutlet weak var login_icon: UILabel!
    @IBOutlet weak var textname: UITextField!
    @IBOutlet weak var textpassward: UITextField!
    @IBOutlet weak var welcome_text: UITextField!
    @IBAction func confirm(_ sender: Any) {
        if((textname.text == "lee")&&(textpassward.text == "123")){
            //显示welcome的文本
            self.welcome_text.text = "Welcome to Alipay!👏"
            self.welcome_text.isHidden = false
        }
        else{
            //输出“用户名或密码错误”
            self.welcome_text.text = "用户名或密码错误❌"
            self.welcome_text.isHidden = false
        }
 
        
    }
}

