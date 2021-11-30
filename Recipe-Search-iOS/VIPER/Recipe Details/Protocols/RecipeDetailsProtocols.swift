//
//  RecipeDetailsProtocols.swift
//  Recipe-Search-iOS
//
//  Created by Hala on 30/11/2021.
//

import UIKit


protocol RecipeDetailsViewProtocol: AnyObject{
    var presenter: RecipeDetailsPresenterProtocol? { get set }
    func showAlert(message: String)
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func reloadData()
}

protocol RecipeDetailsPresenterProtocol: AnyObject{
    var view: RecipeDetailsViewProtocol? { get set }
    var numberOfIngredient: Int? { get }
    func viewDidLoad(withRecipeData recipeData: RecipeData?)
    func configureIntegration(cell: configureRecipDetailsCellProtocol, indexPath: IndexPath)
}

protocol RecipeDetailsRouterProtocol: AnyObject{
    var viewController: UIViewController? { get set }
    func createModule() -> UIViewController
}

protocol RecipeDetailsInteractorInputProtocol: AnyObject{
    var recipeDetailsOutput: RecipeDetailsInteractorOutputProtocol? { get set }
}

protocol RecipeDetailsInteractorOutputProtocol: AnyObject{
    
}


protocol configureRecipDetailsCellProtocol: AnyObject{
    func configureCell(recipeDataModel: RecipeDataViewModel?)
}
