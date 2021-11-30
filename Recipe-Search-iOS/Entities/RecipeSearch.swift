//
//  RecipeSearch.swift
//  Recipe-Search-iOS
//
//  Created by Hala on 30/11/2021.
//

import Foundation

struct RecipeSearch : Codable {
    let recipes : [Recipe]?
    enum CodingKeys: String, CodingKey {
        case recipes = "hits"
    }
}

struct Recipe : Codable {
    let recipe : RecipeData?
}

