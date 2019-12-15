//
//  ViewControllerHelper.swift
//  habit
//
//  Created by WindyZYY on 2019/12/14.
//  Copyright © 2019 ZYY.4.17.SE.SCUT. All rights reserved.
//

import UIKit
import Foundation

public extension UIViewController{
    public func ToggleVisibleForNavigationItem(_ visible : Bool) {
        self.navigationController?.setNavigationBarHidden(!visible, animated: false)
        if !visible {
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        }
    }
    
    public func ToggleVisibleForTabBarItem(_ visible : Bool) {
        self.tabBarController?.tabBar.isHidden = !visible
    }
    
    public func PushVCToCurrentNC(vcName : String, backItem : String?) -> UIViewController? {
            guard let sb = storyboard, let naviController = navigationController else {
                print("无法加载指定的ViewController \(vcName) 到当前ViewController \(self)的NavigationController中。")
                return nil
            }
            hidesBottomBarWhenPushed = true
            let vc = sb.instantiateViewController(withIdentifier: vcName)
            naviController.pushViewController(vc, animated: true)
            
            if let _backItem = backItem {
                vc.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: _backItem, style: .plain , target: nil, action: nil)
            }
            return vc
        }
        
        public func PreventDismissWhenClickOutside() {
            isModalInPopover = true
        }
        
        public func AllowDismissWhenClickOutside() {
            isModalInPopover = false
        }
}

class ViewControllerHelper: UIViewController {

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
