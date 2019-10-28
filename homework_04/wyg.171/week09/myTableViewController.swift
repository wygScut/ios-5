//
//  myTableViewController.swift
//  week09
//
//  Created by Apple on 2019/10/22.
//  Copyright © 2019 wyg. All rights reserved.
//

import UIKit

class myTableViewController: UITableViewController {

    var foodList: [food]=[food]()
    
    func initFoodList(){
        foodList.append(food(name: "apple", foodDescription: "an apple a day"))
        
        foodList.append(food(name: "orange", foodDescription: "I love orange"))
        
        
    }
    func saveFoodList() {
        let success = NSKeyedArchiver.archiveRootObject(foodList, toFile: food.ArchiveURL.path)
        print("Success!")
        if !success {
            print("Failed...")
        }
    }
    
    func loadFoodFile() -> [food]? {
        print("loadSuccess!")
        return (NSKeyedUnarchiver.unarchiveObject(withFile: food.ArchiveURL.path) as? [food])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let defaultFoodList = loadFoodFile(){
            foodList = defaultFoodList
        }else{
            initFoodList()
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func cancelToList(segue: UIStoryboardSegue){//不带数据返回
        
    }
    
    @IBAction func saveToList(segue: UIStoryboardSegue){//带着数据返回
        if let addFoodVC = segue.source as? descriptionViewController{
            if let addFood = addFoodVC.foodForEdit{
                if let selectedIndexPath = tableView.indexPathForSelectedRow{
                    foodList[(selectedIndexPath as NSIndexPath).row] = addFood
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                } else {
                    foodList.append(addFood)//controller 修改model
                    let newIndexPath = IndexPath(row: foodList.count-1, section:0)//controller 控制view
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                }
                 saveFoodList()
            }
        }
    }
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foodList.count
        
    }

    //这一个函数是什么意思啊？
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)

        // Configure the cell...
        //????这一行代码是什么意思啊
        cell.textLabel?.text=foodList[indexPath.row].foodName
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
        
        let descriptionVC = segue.destination as! descriptionViewController
        if let selectedCell = sender as? UITableViewCell {//获得点击的cell
            let indexPath = tableView.indexPath(for: selectedCell)!//获得点击的行数
            let selectedFood = foodList[(indexPath as NSIndexPath).row]//获得该行的food
            descriptionVC.foodForEdit = selectedFood
        }
        
        
    }
    
}
