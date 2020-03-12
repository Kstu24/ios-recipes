//
//  MainViewController.swift
//  Recipes
//
//  Created by Kevin Stewart on 1/15/20.
//  Copyright © 2020 Lambda Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
            netowrkClient.fetchRecipes{ (recipes, error) in
                guard error == nil else {
                    print("Error loading recipies.")
                    return
                }
//                guard recipes != nil else {
//                    print("Error: Recipie was nil.")
//                    return
//                }
                DispatchQueue.main.async {
                    self.allRecipes = recipes!
                }
            }
    }
    //MARK: - Properties
     let netowrkClient = RecipesNetworkClient()
    var allRecipes: [Recipe] = [] {
            didSet{
                filterRecipes()
            }
        }
    var recipesTableViewController: RecipesTableViewController?{
            didSet{
                recipesTableViewController?.recipes = filteredRecipes
            }
        }
    var filteredRecipes: [Recipe] = [] {
            didSet{
                recipesTableViewController?.recipes = filteredRecipes
            }
        }
    // MARK: - Outlets
    @IBOutlet var searchTextField: UITextField!
    // MARK: - Functions
    func filterRecipes(){
    let textField: String! = searchTextField.text == nil ? "" : searchTextField.text!
        
    switch true{
    case textField == "":
        filteredRecipes = allRecipes
    default:
        filteredRecipes = allRecipes.filter{
            textField.contains($0.name) || textField.contains($0.instructions)
        }
    }
}
    @IBAction func searchBarTapped(_ sender: UITextField) {
        resignFirstResponder()
        filterRecipes()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "containerSegue" {
            recipesTableViewController = (segue.destination as! RecipesTableViewController)
            }
    }
}
