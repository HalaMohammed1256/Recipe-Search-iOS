//
//  RecipeSearchPresenter.swift
//  Recipe-Search-iOS
//
//  Created by Hala on 29/11/2021.
//

import Foundation

//enum RecipeCategory {
//    case 
//}


class RecipeSearchPresenter: RecipeSearchPresenterProtocol, RecipeSearchInteractorOutputProtocol {
    
    
    weak var view: RecipeSearchViewProtocol?
    private var interactor: RecipeSearchInteractorInputProtocol?
    private var router: RecipeSearchRouterProtocol?
    private var recipes = [Recipe]()
    
    var numberOfSearchResultRow: Int{
        return recipes.count
    }
    
    init(view: RecipeSearchViewProtocol, interactor: RecipeSearchInteractorInputProtocol, router: RecipeSearchRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func getSearchResult(searchText: String) {
        view?.showLoadingIndicator()
        interactor?.getSearchResult(searchText: searchText)
    }
    
    func configureResult(cell: RecipeResultTableViewCell, indexPath: IndexPath) {
        let recipe = recipes[indexPath.row]
        guard let recipeData = recipe.recipe else {
            return
        }
        cell.configure(model: recipeData)
    }
    
    func recipeSearchResultFetchedSuccessfully(recipes: [Recipe]) {
        if recipes.count == 0{
            view?.searchResultDataVisability(isHidden: true, message: "Your search not exist")
        }else{
            self.recipes.append(contentsOf: recipes)
            view?.searchResultDataVisability(isHidden: false, message: "Type your recipe that you searching for")
            view?.reloadData()
        }
        
        view?.hideLoadingIndicator()
    }
    
    
    func recipeSearchResultFetchingFailed(withError error: Error) {
        view?.hideLoadingIndicator()
        view?.searchResultDataVisability(isHidden: true, message: "Type your recipe that you searching for")
        view?.showAlert(message: error.localizedDescription)
    }
    
    //??
    
    var numberOfCategoryItem: Int{
        return 1//recipes.count
    }
    
    func configureCategory(cell: RecipeSearchCategorySearchCell, indexPath: IndexPath) {
        
    }
    
    func recipeSearchCategoryFetchedSuccessfully() {

    }
    
    func recipeSearchCategoryFetchingFailed(withError error: Error) {
        view?.hideLoadingIndicator()
        view?.showAlert(message: error.localizedDescription)
    }
    
}
