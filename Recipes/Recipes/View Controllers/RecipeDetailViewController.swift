//
//  RevipeDetailViewController.swift
//  Recipes
//
//  Created by Kevin Stewart on 1/15/20.
//  Copyright © 2020 Lambda Inc. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    //MARK: - Properties
    var recipe: Recipe? {
        didSet {
            updateViews()
        }
    }
    //MARK: - Outlets
    @IBOutlet var recipeNameLabel: UILabel!
    @IBOutlet var recipeTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    //MARK: - Functions
    func updateViews() {
        guard self.isViewLoaded,
        let recipe = recipe else { return }
        recipeNameLabel.text = recipe.name
        recipeTextView.text = recipe.instructions
        
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
