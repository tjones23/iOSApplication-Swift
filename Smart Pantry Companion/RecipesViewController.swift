//
//  RecipesViewController.swift
//  Smart Pantry
//
//  Created by Anthony Jones on 2/10/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit

class RecipesViewController: UITableViewController {
    // MARK: - Initialization
    
    public var items = [RecipeItem]()
    public var count = 0

    // MARK: - Server Retrieval
    
    private func loadItems() {
        // SQL server retrieval code goes here... stores retrieved data into 'items' and the total # of items in 'count'
        // Temporary values until server is implemented
        items.removeAll()
        let name = ["Mac & Cheese", "Lasagna", "Buffalo Chicken Dip"]
        let ingredients = [
            [ ["Salt", "4 tblspn"], ["Butter", "8 tblspn"], ["Milk", "4 oz"] ],
            [ ["Lasagna Noodles", "1 Pound"], ["Ricotta Cheese", "8 oz"], ["Mozzeralla Cheese", "8 oz"] ],
            [ ["Cream Cheese", "1/2 pound"], ["Cheddar Cheese", "4 oz"], ["Hot Sauce", "4 oz"], ["Ranch Dressing", "1 oz"] ]
        ]
        
        // Append each recipe item to 'items'
        for i in 0...2 {
            let item = RecipeItem(name: name[i], ingredients: ingredients[i])
            items.append(item)
        }
        
        if let defaults = UserDefaults.standard.data(forKey: "key"),
            let i = try? JSONDecoder().decode(RecipeItem.self, from: defaults) {
            if i.name != nil {
                items.append(i)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadItems()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rec0", for: indexPath)
        cell.textLabel!.text = items[indexPath.row].name
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            items.remove(at: indexPath.row)
            let defaults = UserDefaults.standard
            defaults.removeObject(forKey: "key")
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            items.append(RecipeItem())
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let item = items[fromIndexPath.row]
        items.remove(at: fromIndexPath.row)
        items.insert(item, at: to.row)
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    // Action taken when accessory button is tapped on a certain cell
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        // Send item name to AccessoryView
        let item = items[indexPath.row]
        let defaults = UserDefaults.standard
        if let encoded = try? JSONEncoder().encode(item) {
            UserDefaults.standard.set(encoded, forKey: "key")
        }
        defaults.synchronize()
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
