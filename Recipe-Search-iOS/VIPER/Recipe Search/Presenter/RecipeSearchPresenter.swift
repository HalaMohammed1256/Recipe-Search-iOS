//
//  RecipeSearchPresenter.swift
//  Recipe-Search-iOS
//
//  Created by Hala on 29/11/2021.
//

import Foundation

enum RecipeCategory {
    case All
    case Low_Sugar
    case Keto
    case Vegan
    
    var name: String{
        switch self {
        case .All:
            return "All"
        case .Low_Sugar:
            return "Low Sugar"
        case .Keto:
            return "Keto"
        case .Vegan:
            return "Vegan"
        }
    }
    
    var filterAPIName: String?{
        switch self {
        case .All:
            return nil
        case .Low_Sugar:
            return "low-sugar"
        case .Keto:
            return "keto-friendly"
        case .Vegan:
            return "vegan"
        }
    }
}


class RecipeSearchPresenter: RecipeSearchPresenterProtocol, RecipeSearchInteractorOutputProtocol {
    
    weak var view: RecipeSearchViewProtocol?
    private var interactor: RecipeSearchInteractorInputProtocol?
    private var router: RecipeSearchRouterProtocol?
    private var recipes = [Recipe]()
    internal var categories: [RecipeCategory] = [.All, .Low_Sugar, .Keto, .Vegan]
    
    var numberOfSearchResultRow: Int{
        return recipes.count
    }
    
    var numberOfCategoryItem: Int{
        return categories.count
    }
    
    init(view: RecipeSearchViewProtocol, interactor: RecipeSearchInteractorInputProtocol, router: RecipeSearchRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func getSearchResult(searchText: String, filter: String?) {
        view?.showLoadingIndicator()
        interactor?.getSearchResult(searchText: searchText, filter: filter)
    }
    
    
    func recipeSearchResultFetchedSuccessfully(recipes: [Recipe]) {
        if recipes.count == 0{
            view?.searchResultDataVisability(isHidden: true, message: "Your search not exist")
        }else{
            self.recipes = recipes
            view?.searchResultDataVisability(isHidden: false, message: "Type your recipe that you searching for")
        }
        view?.reloadData()
        view?.hideLoadingIndicator()
    }
    
    
    func recipeSearchResultFetchingFailed(withError error: Error) {
        view?.hideLoadingIndicator()
        view?.searchResultDataVisability(isHidden: true, message: "Type your recipe that you searching for")
        view?.showAlert(message: error.localizedDescription)
    }
    
    func configureResult(cell: RecipeSearchResultSearchCellProtocol, indexPath: IndexPath) {
        let recipe = recipes[indexPath.row]
        guard let recipeData = recipe.recipe else {
            return
        }
        cell.configure(model: recipeData)
    }
    
    func getRecipDetails(indexPath: IndexPath) -> RecipeData?{
        return recipes[indexPath.row].recipe
    }
    
        
    func configureCategory(cell: RecipeSearchCategorySearchCellProtocol, indexPath: IndexPath) {
        let category = categories[indexPath.row]
        cell.configure(model: category)
    }
    
    func getCategoryName(indexPath: IndexPath) -> String{
        return categories[indexPath.row].name
    }
    
    
}
