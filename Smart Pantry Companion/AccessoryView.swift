//
//  AccessoryView.swift
//  Smart Pantry
//
//  Created by Anthony Jones on 3/10/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit

class AccessoryView: UITableViewController {
    var item = InventoryItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let defaults = UserDefaults.standard.data(forKey: "key"),
            let i = try? JSONDecoder().decode(InventoryItem.self, from: defaults) {
                item = i
                self.navigationItem.title = item.name
                
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "acc", for: indexPath)

        // Configure the cell...
        if indexPath.row == 0 {
            cell.textLabel?.text = "Expiration Date"
            cell.detailTextLabel?.text = item.exp
        }
        else if indexPath.row == 1 {
            cell.textLabel?.text = "Amount Left"
            var amount = String(item.currentWeight / item.totalWeight * 100)
            amount += "%"
            cell.detailTextLabel?.text = amount
        }
        else if indexPath.row == 2 {
            cell.textLabel?.text = "Price"
            var price = "$"
            price += String(item.price)
            cell.detailTextLabel?.text = price
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
