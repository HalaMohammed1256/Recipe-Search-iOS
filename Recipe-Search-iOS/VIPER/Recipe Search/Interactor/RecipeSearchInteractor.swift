

import Foundation


class RecipeSearchInteractor: RecipeSearchInteractorInputProtocol {
    
    weak var recipeSearchOutput: RecipeSearchInteractorOutputProtocol?
    private var searchWorker = RecipeSearchWorker()
    
    let defaults = UserDefaults.standard
      
    func getSearchResult(searchText: String, filter: String?) {
        searchWorker.getSearchResult(searchText: searchText, filter: filter) { [weak self] result in
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
    
    func setSearchHistory(searchText: String) {
        var historyArray = [searchText]
        if var history = defaults.stringArray(forKey: Constants.historyArrayKey){
            if history.count == 10{
                history.removeLast()
            }
            if history.contains(searchText){
                historyArray.removeAll()
            }
            historyArray.append(contentsOf: history)
        }
        defaults.set(historyArray, forKey: Constants.historyArrayKey)
    }
    
    
}
