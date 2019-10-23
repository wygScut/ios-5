//
//  TableViewController.swift
//  ZYY-demo2
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 ZYY.4.17.SE.SCUT. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var foodList: [food] = [food]()
    
    func initFoodList (){
        //loadFoodFile()
        foodList.append(food(name: "apple", category: "fruit", foodDescription: "An apple a day"))
        foodList.append(food(name: "orange", category: "fruit", foodDescription: "VC"))
    }
    
    func saveFoodList() {
        let success = NSKeyedArchiver.archiveRootObject(foodList, toFile: food.ArchiveURL.path)
        print("Success!")
        if !success {
            print("Failed...")
        }
    }
    
    func loadFoodFile() -> [food]? {
        print("loadOK")
        return (NSKeyedUnarchiver.unarchiveObject(withFile: food.ArchiveURL.path) as? [food])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        if let defaultFoodList = loadFoodFile(){
            foodList = defaultFoodList
        }else{
            initFoodList()
        }
    }

    // MARK: - Table view data source
    

    @IBAction func cancelToList (segue: UIStoryboardSegue){//不带数据返回,没有connection，可以看作是一个出口，即exit
        
    }

    @IBAction func saveToList (segue: UIStoryboardSegue){//带着数据返回
        if let addFoodVC = segue.source as? DescriptionViewController{//首先取得刚刚装订的内容
            if let addFood = addFoodVC.foodForEdit{
                if let selectedIndexPath = tableView.indexPathForSelectedRow{//先看有木有点击过某个cell，有的话就是update
                    foodList[(selectedIndexPath as NSIndexPath).row] = addFood
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                    print("update")
                } else {//没有点击过，就是采取append增加
                    foodList.append(addFood)//controller 修改model
                    let newIndexPath = IndexPath(row: foodList.count-1, section:0)//controller 控制view
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                    print("add")
                }
                saveFoodList()
            }
        }
    }
        
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foodList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //定义常量  从indexPath行取出一个reuseIdentifier的东西出来，赋值给cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = foodList[indexPath.row].foodName
        cell.detailTextLabel?.text = foodList[indexPath.row].foodCategory
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            foodList.remove(at: indexPath.row)
            saveFoodList()
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {//给description传参数
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "showDetail"){
            let descriptionVC = segue.destination as! DescriptionViewController//!表示不能为空
            if let selectedCell = sender as? UITableViewCell{//？表示可能为空  //获得点击的cell
                let indexPath = tableView.indexPath(for: selectedCell)!//获得点击的cell的indexPath即点击的行数
                let selectedFood = foodList[(indexPath as NSIndexPath).row]//获得该行存下的food
                descriptionVC.foodForEdit = selectedFood//跳转到descriptionViewController 被编辑的food就是刚刚选择的selectedFood
            }
            print("show detail view")
        }else {
            print("add new food")
        }
    }
}
