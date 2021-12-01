

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
    var categories: [RecipeCategory] { get set }
    var numberOfSearchResultRow: Int { get }
    func getRecipDetails(indexPath: IndexPath) -> RecipeData?
    func getCategoryName(indexPath: IndexPath) -> String
    func getSearchResult(searchText: String, filter: String?)
    func configureCategory(cell: RecipeSearchCategorySearchCellProtocol, indexPath: IndexPath)
    func configureResult(cell: RecipeSearchResultSearchCellProtocol, indexPath: IndexPath)
}

protocol RecipeSearchRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    static func createModule() -> UIViewController
}
 
// Interactor Protocols
protocol RecipeSearchInteractorInputProtocol: AnyObject {
    var recipeSearchOutput: RecipeSearchInteractorOutputProtocol? { get set }
    func getSearchResult(searchText: String, filter: String?)
    func setSearchHistory(searchText: String)
}

protocol RecipeSearchInteractorOutputProtocol: AnyObject {
    func recipeSearchResultFetchedSuccessfully(recipes: [Recipe])
    func recipeSearchResultFetchingFailed(withError error: Error)
}

// cells
protocol RecipeSearchResultSearchCellProtocol {
    func configure(model: RecipeData)
}

protocol RecipeSearchCategorySearchCellProtocol {
    func configure(model: RecipeCategory)
}
