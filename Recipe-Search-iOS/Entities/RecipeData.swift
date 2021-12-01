



struct RecipeData : Codable {
    let label : String?
    let image : String?
    let source : String?
    let url : String?
    let healthLabels : [String]?
    let ingredientLines : [String]?
}


struct RecipeDataViewModel {
    let label : String?
    let ingredient : String?
    init(label: String?, integrate: String?) {
        self.label = label
        self.ingredient = integrate
    }
}
