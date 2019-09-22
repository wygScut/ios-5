//
//  ViewController.swift
//  testView
//
//  Created by fengyuxiang on 2019/9/17.
//  Copyright © 2019 fengyuxiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let initView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        initView.backgroundColor = UIColor.green
        self.view = initView
        
        let secondView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        secondView.backgroundColor = UIColor.red
        self.view.addSubview(secondView)
        
        let labelView = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
        labelView.text = "hello world"
        labelView.backgroundColor = UIColor.blue
        self.view.addSubview(labelView)
        
        UIView.animate(withDuration: 1){
            var transformTranslate = secondView.transform
            transformTranslate = transformTranslate.translatedBy(x: 100, y: 100)
            secondView.transform = transformTranslate
        }
        UIView.animate(withDuration: 0.5, animations: {() -> Void in var transformRotate = labelView.transform
            transformRotate = transformRotate.rotated(by: CGFloat(Double.pi/4))
            labelView.transform = transformRotate
            
        })
        
    }


}

