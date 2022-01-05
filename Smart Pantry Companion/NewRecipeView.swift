//
//  NewRecipeView.swift
//  Smart Pantry
//
//  Created by Anthony Jones on 3/27/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit

class NewRecipeView: UIViewController {
    var ingredients = [String]()
    var recItems = RecipesViewController()
    
    @IBOutlet var recName: UITextField?
    @IBOutlet var ing1: UITextField?
    @IBOutlet var amt1: UITextField?
    @IBOutlet var ing2: UITextField?
    @IBOutlet var amt2: UITextField?
    @IBOutlet var ing3: UITextField?
    @IBOutlet var amt3: UITextField?

    
    // Insert new recipe into recipe list
    @IBAction func insertRec(_ sender: Any) {
        let rname = recName?.text
        let i1 = ing1?.text
        let a1 = amt1?.text
        let i2 = ing2?.text
        let a2 = amt2?.text
        let i3 = ing3?.text
        let a3 = amt3?.text
        let ings = [[i1, a1], [i2, a2], [i3, a3]]
        let newRec = RecipeItem(name: rname, ingredients: ings as! [[String]])
        let item = newRec
        let defaults = UserDefaults.standard
        if let encoded = try? JSONEncoder().encode(item) {
            UserDefaults.standard.set(encoded, forKey: "key")
        }
        defaults.synchronize()
        performSegue(withIdentifier: "newRec", sender: nil)
    }
    
    // Insert new cell below to add another ingredient to the recipe
    /*@IBAction func addIngredient(_ sender: Any) {
        ingredients.append("")
        let indexPath = IndexPath(row: ingredients.count, section: 1)
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    /*override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return ingredients.count + 1
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "recName", for: indexPath)
            // Configure the cell...
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "recIngredients", for: indexPath)
            // Configure the cell...
            return cell
        }
    }
    
    // Override to support section header naming
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Recipe Name"
        }
        else {
            return "Indgredients"
        }
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            ingredients.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            ingredients.append("")
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    // Override to support selective editing of the table cells
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section > 0 {
            return true
        }
        else {
            return false
        }
    }
    */
}
