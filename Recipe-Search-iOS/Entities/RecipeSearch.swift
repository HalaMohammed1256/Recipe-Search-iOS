

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

