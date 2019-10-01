//
//  ViewController.swift
//  ZYY-demo1
//
//  Created by Apple on 2019/9/10.
//  Copyright © 2019 ZYY.4.17.SE.SCUT. All rights reserved.
//  有完善的自动布局
//  根据输入有完整的输出
//  实现动画效果

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var ResearchTest: UISearchBar!
    @IBOutlet weak var showAns: UILabel!
    
    @IBAction func research(_ sender: Any) {
        if(ResearchTest.text == "Taylor Swift"){
            showAns.text = "ME!(《LOVER》）"
        }else {
            showAns.text = "NONE!"
        }
    }
}

