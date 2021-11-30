//
//  RecipeSearchWorker.swift
//  Recipe-Search-iOS
//
//  Created by Hala on 29/11/2021.
//

import Foundation


class RecipeSearchWorker{
    func getSearchResult(searchText: String, isFinishCompletionWithResult: @escaping (Result<RecipeSearch>) -> Void) {
        let paramters = ["q": searchText, "app_id": APIUrls.app_id.rawValue, "app_key": APIUrls.app_key.rawValue]
        ApiServices.instance.getResponse(url: APIUrls.baseURL.rawValue, paramters: paramters, headers: nil, method: .get, completion: isFinishCompletionWithResult)
    }
}
