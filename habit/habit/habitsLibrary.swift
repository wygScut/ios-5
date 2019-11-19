//
//  habitsLibrary.swift
//  habit
//
//  Created by Apple on 2019/11/12.
//  Copyright © 2019 ScutSE-iOS-5. All rights reserved.
//
/*
 属性
 习惯数组
 今日等待打卡的习惯
 ？？按日期存储的习惯打卡-》这个怎么处理
 上一次更新时间
 
 方法
 每次启动app初始化操作（）
 打卡
 添加习惯
 修改习惯
 删除习惯
 查找习惯
 展示某一天所有打卡的习惯
 */
//待完成功能
//1.颜色处理
//2.图标导入
//3.闹钟


import Foundation
class HabitsLibrary{
    var habits=[Habit]()
    //key值是今天未打卡的习惯的ID值，value值没有用
    var habits_today_not_punch=[Int:Int]()
    var lastUpdate=Date(timeIntervalSince1970: 0)
    
    init() {
        
    }
    //初始化今天的list
    func init_today(){
        if(should_init()){
            for it in habits{
                if(it.alive!){
                    habits_today_not_punch.updateValue(1, forKey: it.id!)
                }
            }
            self.lastUpdate = Date()
        }
        
        
        //根据上一次更新时间来确定本次是否要更新
    }
    func should_init()->Bool
    {
        let now = Date()
        let d_year = DateFormatter()
        let d_month = DateFormatter()
        let d_day = DateFormatter()
        d_year.dateFormat="yyyy"
        d_month.dateFormat="MM"
        d_day.dateFormat="dd"
        
        let n_year=d_year.string(from: now)
        
        let n_month=d_month.string(from: now)
        
        let n_day=d_day.string(from: now)
        
        let l_year=d_year.string(from: self.lastUpdate)
        
        let l_month=d_month.string(from: self.lastUpdate)
        
        let l_day=d_day.string(from: self.lastUpdate)
        
        if(l_year==n_year&&l_month==n_month&&l_day==n_day){
            return false
        }
        return true
    }
    //打卡
    func punch(id:Int){
        habits[id].total_time=habits[id].total_time!+1
        habits_today_not_punch.removeValue(forKey: id)
        //要处理前台数据绑定
    }
    
    //待添加颜色，图标属性
    func add_habit(add_name:String,add_reminder:String,add_time_class:TimeClass){
        let temp=Habit(id: habits.count, name: add_name, reminder: add_reminder, time_class: add_time_class)
        habits.append(temp)
        habits_today_not_punch.updateValue(0, forKey: temp.id!)
        
    }
    
    func delete_habit(id:Int){
        habits[id].alive=false
        habits_today_not_punch.removeValue(forKey: id)
        //要处理前台数据绑定
    }
    
    //这是首页第一栏的功能，待写
    func find_habit(find_name:String)->[Int]
    {
        var ans=[Int]()
        for (key,_) in habits_today_not_punch{
            if(has_subStrings(this_string: habits[key].name!, subString: find_name)){
                ans.append(key)
            }
            
        }
        
        return ans
    }
    func show_habits(){
        print("展示所有的习惯")
        for it in habits{
            it.show_habit()
        }
        
    }
    //待添加颜色，图标属性
    func modify_habit(id:Int,m_name:String,m_reminder:String,m_time_class:TimeClass){
        habits[id].name=m_name
        habits[id].reminder=m_reminder
        habits[id].time_class=m_time_class
        
    }
    func show_today_habits(){
        print("展示今天的待打卡的习惯")
        for (key,_) in habits_today_not_punch{
            habits[key].show_habit()
        }
    }
}


func has_subStrings(this_string:String,subString:String)->Bool{
    
    let len_ts=this_string.count
    let len_ss=subString.count
    var i=0
    while(i<=len_ts-len_ss){
        let help_string = get_subString(first: i, end: i+len_ss, s: this_string)
        if(help_string==subString){
            return true
        }
        i=i+1
    }
    return false
}
func get_subString(first:Int,end:Int,s:String)->String{
    return String(String(s.prefix(end)).suffix(end-first))
    
}
