//
//  food.swift
//  ZYY-demo2
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 ZYY.4.17.SE.SCUT. All rights reserved.
//

import Foundation
class food: NSObject, NSCoding{
    func encode(with aCoder: NSCoder) {//加键值对
        aCoder.encode(foodName, forKey: "nameKey")
        aCoder.encode(foodCategory, forKey: "categoryKey")
    }
    
    required init?(coder aDecoder: NSCoder) {//根据键值提取
        foodName = aDecoder.decodeObject(forKey: "nameKey") as? String
        foodCategory = aDecoder.decodeObject(forKey: "categoryKey") as? String
    }
    
    var foodName: String?
    var foodCategory: String?
    var foodDescription: String?
    
    
    //获取App文件夹的根目录
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in:  .userDomainMask).first!
    //创建一个子目录，用于之后存取东西
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("foodList")
    
    init(name:String?, category:String?, foodDescription:String?){
        self.foodName = name
        self.foodCategory = category
        self.foodDescription = foodDescription
    }
}
