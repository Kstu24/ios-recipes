//
//  RecipesTableViewController.swift
//  Recipes
//
//  Created by Kevin Stewart on 1/15/20.
//  Copyright © 2020 Lambda Inc. All rights reserved.
//

import UIKit

class RecipesTableViewController: UITableViewController {
    
    //MARK: - Properties
    var recipes: [Recipe] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "containerCell", for: indexPath)
        cell.textLabel?.text = recipes[indexPath.row].name
        return cell
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "containerDetailSegue" else { return }
        guard let recipeDetailVC = segue.destination as? RecipeDetailViewController else { return }
        let row = tableView.indexPathForSelectedRow?.row
        recipeDetailVC.recipe = recipes[row!]
    }
    


}
