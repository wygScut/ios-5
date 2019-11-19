//
//  habit.swift
//  habit
//
//  Created by 魏一戈 on 2019/11/12.
//  Copyright © 2019年 ScutSE-iOS-5. All rights reserved.
//
/*
 习惯类
 属性
 ID序号（唯一索引）
 名字
 图标
 颜色【若干安全色枚举】
 提醒语
 坚持时间
 打卡时间类别【7个枚举属性】：起床 早上 中午 下午 晚上 睡前 任何时间
 //是否已经放弃
 
    习惯派生类
    每天习惯类
 属性
 
 每周习惯类
    每周打卡时间
 本周已打卡次数
    每月习惯类
 本月已打卡次数
    每月打卡次数
 */import Foundation
enum TimeClass {
    case GETUP
    case MORING
    case NOON
    case AFTERNOON
    case EVENING
    case BEFORESLEEP
    case ANYTIME
}
class Habit{
    var id:Int?
    var name:String?
    //图标
    //颜色
    var total_time:Int?
    var stick_to_time:Int?
    var reminder:String?
    var time_class:TimeClass?
    var alive:Bool?
    init(id:Int,name:String,reminder:String,time_class:TimeClass) {
        self.id=id
        self.name=name
        self.reminder=reminder
        self.time_class=time_class
        self.alive=true
        self.total_time=0
    }
    func show_habit(){
        
        print("id",self.id)
        print("name",self.name)
        print("alive",self.alive)
        print("total_time",self.total_time)
        print("reminder",self.reminder)
        print(" ")
    }
}
