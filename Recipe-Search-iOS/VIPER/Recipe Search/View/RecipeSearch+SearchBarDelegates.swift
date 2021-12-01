

import UIKit


extension RecipeSearchViewController: UISearchResultsUpdating, UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        categorySelectedIndex = 0
        guard let searchText = searchBar.text else { return }
        let textWithoutSpace = searchText.trimWhiteSpace()
                
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z0-9 ].*", options: [])
            let value = regex.firstMatch(in: searchText, options: [], range: NSMakeRange(0, searchText.count))

            if value == nil && textWithoutSpace.count > 0{
                searchControllerText = textWithoutSpace
                presenter?.getSearchResult(searchText: textWithoutSpace, filter: nil)
            }else{
                searchResultDataVisability(isHidden: true, message: "Type your recipe that you searching for")
                showAlert(message: textWithoutSpace.count == 0 ? "Empty spaces and text not allawed" : ( value != nil ? "only english letters are allawed" : ""))
            }
            searchController.searchBar.text = ""
            dismiss(animated: true, completion: nil)

        }
        catch {
            print("ERROR")
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        searchController.searchResultsController?.view.isHidden = false
        if let viewController = searchController.searchResultsController as? SearchHistoryViewController{
            viewController.historySearchProtocol = self
        }
        if let text = searchController.searchBar.text, text == ""{
            categorySelectedIndex = 0
            searchResultDataVisability(isHidden: true, message: "Type your recipe that you searching for")
        }
    }
    
}
