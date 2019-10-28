//
//  food.swfit.swift
//  week09
//
//  Created by Apple on 2019/10/22.
//  Copyright © 2019 wyg. All rights reserved.
//
//
//import Foundation
//class food{
//    var name:String?
//    var description:String?
//
//    init(name:String?, description:String?){
//        self.name = name
//        self.description = description
//    }
//
//
//}


import Foundation
class food:NSObject,NSCoding{
    func encode(with aCoder: NSCoder) {//加key-value对
        aCoder.encode(foodName,forKey: "nameKey")
        aCoder.encode(foodDescription,forKey: "descriptionKey")
    }
    
    required init?(coder aDecoder: NSCoder) {//提取
       foodName=aDecoder.decodeObject(forKey: "nameKey")as? String
       foodDescription=aDecoder.decodeObject(forKey: "descriptionKey")as? String
        
    }
    var foodName:String?
    var foodDescription:String?
    
    //获取App文件夹的根目录
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory,in: .userDomainMask).first!
    
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("foodList")
    
    init(name:String?,foodDescription:String?){
        self.foodName = name
        self.foodDescription = foodDescription
    }
}

