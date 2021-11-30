//
//  RecipeSearch+SearchBarDelegates.swift
//  Recipe-Search-iOS
//
//  Created by Hala on 28/11/2021.
//

import UIKit

extension RecipeSearchViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        presenter?.getSearchResult(searchText: searchBar.text ?? "")
        
    }
}
