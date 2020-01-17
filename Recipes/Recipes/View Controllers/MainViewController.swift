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
        netowrkClient.fetchRecipes(completion: { (recipes, error) in
             let recipes = recipes
             let thereIsAnError = error == nil ? false : true
            if thereIsAnError {
                print("Error")
             } else {
                 self.allRecipes = recipes!
             }
         })

    
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Properties
     let netowrkClient = RecipesNetworkClient()
    
    var allRecipes: [Recipe] = [] {
            didSet{
                filteredRecipes()
            }
        }
        
    var recipesTableViewController: RecipesTableViewController?{
            didSet{
                recipesTableViewController?.recipes = filterRecipes
            }
        }
        
    var filterRecipes: [Recipe] = [] {
            didSet{
                recipesTableViewController?.recipes = filterRecipes
            }
        }

    
    // MARK: - Outlets
    
    @IBOutlet var searchTextField: UITextField!
    
    // MARK: - Functions
    
    func filteredRecipes(){
    let textField: String! = searchTextField.text == nil ? "" : searchTextField.text!

    switch true{
    case textField == "":
        filterRecipes = allRecipes
    default:
        filterRecipes = allRecipes.filter{
            textField.contains($0.name) || textField.contains($0.instructions)
        }
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
}
