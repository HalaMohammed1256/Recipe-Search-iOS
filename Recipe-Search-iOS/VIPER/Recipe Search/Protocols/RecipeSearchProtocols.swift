//
//  RecipeSearchProtocols.swift
//  Recipe-Search-iOS
//
//  Created by Hala on 29/11/2021.
//

import UIKit


protocol RecipeSearchViewProtocol: AnyObject {
    var presenter: RecipeSearchPresenterProtocol? { get set }
    func searchResultDataVisability(isHidden: Bool, message: String)
    func showAlert(message: String)
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func reloadData()
}

protocol RecipeSearchPresenterProtocol: AnyObject {
    var view: RecipeSearchViewProtocol? { get set }
    var numberOfCategoryItem: Int { get }
    var numberOfSearchResultRow: Int { get }
    func getSearchResult(searchText: String)
    func configureCategory(cell: RecipeSearchCategorySearchCell, indexPath: IndexPath)
    func configureResult(cell: RecipeResultTableViewCell, indexPath: IndexPath)
}

protocol RecipeSearchRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    static func createModule() -> UIViewController
}

// Interactor Protocols
protocol RecipeSearchInteractorInputProtocol: AnyObject {
    var recipeSearchOutput: RecipeSearchInteractorOutputProtocol? { get set }
    func getSearchResult(searchText: String)
    func getSearchCategory()
}

protocol RecipeSearchInteractorOutputProtocol: AnyObject {
    func recipeSearchResultFetchedSuccessfully(recipes: [Recipe])
    func recipeSearchResultFetchingFailed(withError error: Error)
    func recipeSearchCategoryFetchedSuccessfully() //??
    func recipeSearchCategoryFetchingFailed(withError error: Error)
}

// cells
protocol RecipeSearchResultSearchCell {
    func configure(model: RecipeData)
}

protocol RecipeSearchCategorySearchCell {
    func configure(model: String) //??
}
