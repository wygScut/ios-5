//
//  MoreSettingTableControllerViewController.swift
//  habit
//
//  Created by Apple on 2019/11/19.
//  Copyright © 2019 ZYY.4.17.SE.SCUT. All rights reserved.
//

import UIKit

class MoreSettingTableViewController: MoreViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var CELL_IDENTIFIER = "OptionsCell"
    
    var optionsList: [options] = [options]()
    let defaultImg = UIImage(named:"myHabit")
    func initOptionsList() {
        optionsList.append(options(name: "myHabits", img: UIImage(named:"myHabit"), target: "habitView"))
        optionsList.append(options(name: "myCards", img: UIImage(named: "cards"), target: "cardsView"))
        optionsList.append(options(name: "Finished", img: UIImage(named: "finished"), target: "finishedView"))
        optionsList.append(options(name: "settings", img: UIImage(named: "setting"), target: "settingView"))
        optionsList.append(options(name: "contact us", img: UIImage(named: "about"), target: "contactUsView"))
    }
    
    @IBOutlet weak var settingTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initOptionsList()
        settingTableView.delegate = self
        settingTableView.dataSource = self
        self.settingTableView.rowHeight = 70
    }
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return optionsList.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER, for: indexPath)
        
        if let optionCell = cell as? optionsTableViewCell {
        
            optionCell.imageOfOptions.image = optionsList[indexPath.row].optionsAvator
            optionCell.NameOfOptions.text = optionsList[indexPath.row].optionsName
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellItem = optionsList[indexPath.row]
        let typedCellItem = cellItem
        PushVCToCurrentNC(vcName: typedCellItem.targetStoryboard, backItem: "More")
    }
    
    // Override to support editing the table view.
    /*
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }*/
    
}
