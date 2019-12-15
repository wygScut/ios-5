//
//  ContactViewController.swift
//  habit
//
//  Created by WindyZYY on 2019/12/15.
//  Copyright © 2019 ZYY.4.17.SE.SCUT. All rights reserved.
//

import UIKit

public extension UIView{
    public func pin(to view: UIView){
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

public extension UIStackView{
    public func AddBackgroundColor(_ color : UIColor){
        let view = UIView()
        view.backgroundColor = color
        
        view.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(view, at: 0)
        view.pin(to: self)
    }
}

class ContactViewController: UIViewController {

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
