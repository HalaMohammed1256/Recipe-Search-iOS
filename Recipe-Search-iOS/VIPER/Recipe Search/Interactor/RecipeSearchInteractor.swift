//
//  RecipeSearchInteractor.swift
//  Recipe-Search-iOS
//
//  Created by Hala on 29/11/2021.
//

import Foundation


class RecipeSearchInteractor: RecipeSearchInteractorInputProtocol {
    
    weak var recipeSearchOutput: RecipeSearchInteractorOutputProtocol?
    private var searchWorker = RecipeSearchWorker()
    
    func getSearchResult(searchText: String) {
        searchWorker.getSearchResult(searchText: searchText) { [weak self] result in
            switch result{
            case .success(let recipe):
                guard let recipes = recipe.recipes else{
                    return
                }
                self?.recipeSearchOutput?.recipeSearchResultFetchedSuccessfully(recipes: recipes)
                
            case .failure(let error):
                self?.recipeSearchOutput?.recipeSearchResultFetchingFailed(withError: error)
            }
        }
    }
    
    func getSearchCategory() {
        
    }
    
    
}
