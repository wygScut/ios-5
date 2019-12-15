//
//  options.swift
//  habit
//
//  Created by Apple on 2019/11/19.
//  Copyright © 2019 ZYY.4.17.SE.SCUT. All rights reserved.
//

import Foundation
import UIKit
class options: NSObject {
    var optionsName: String?
    var optionsAvator: UIImage?
    var targetStoryboard: String!
    
    init(name: String?, img: UIImage?, target: String!){
        self.optionsName = name
        self.optionsAvator = img
        self.targetStoryboard = target
    }

//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(optionsName, forKey: "nameKey")
//    }
//    required init?(coder aDecoder: NSCoder) {
//        optionsName = aDecoder.decodeObject(forKey: "nameKey") as? String
//    }
}
