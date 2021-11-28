//
//  RecipeSearchViewController.swift
//  Recipe-Search-iOS
//
//  Created by Hala on 28/11/2021.
//

import UIKit

class RecipeSearchViewController: UIViewController {
    
    // variables
    
    
    // outlets
    @IBOutlet weak var recipeSearchBar: UISearchBar!
    @IBOutlet weak var recipeSearchCategoryCollectionView: UICollectionView!
    @IBOutlet weak var recipeSearchResultTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configureEllement()

    }


    init() {
        super.init(nibName: String(describing: RecipeSearchViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureEllement(){
        setupDelegatesAndCells()
    }
    
    func setupDelegatesAndCells(){
        recipeSearchBar.delegate = self
        
        recipeSearchCategoryCollectionView.delegate = self
        recipeSearchCategoryCollectionView.dataSource = self
        
        recipeSearchResultTableView.delegate = self
        recipeSearchResultTableView.dataSource = self
        
        recipeSearchCategoryCollectionView.registerCell(cellClass: RecipeCategoryCollectionViewCell.self)
        recipeSearchResultTableView.registerCell(cellClass: RecipeResultTableViewCell.self)
        
    }
   

}
