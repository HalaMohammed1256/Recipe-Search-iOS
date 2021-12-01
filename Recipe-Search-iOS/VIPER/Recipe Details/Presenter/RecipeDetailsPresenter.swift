

import Foundation


class RecipeDetailsPresenter: RecipeDetailsPresenterProtocol {
    
    
    weak var view: RecipeDetailsViewProtocol?
    private var router: RecipeDetailsRouterProtocol?
    private var recipeData: RecipeData?
    
    var numberOfIngredient: Int?{
        return recipeData?.ingredientLines?.count
    }
    
    init(view: RecipeDetailsViewProtocol, router: RecipeDetailsRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func viewDidLoad(withRecipeData recipeData: RecipeData?) {
        self.recipeData = recipeData
    }
     
    func configureIntegration(cell: configureRecipDetailsCellProtocol, indexPath: IndexPath) {
        let ingredient = recipeData?.ingredientLines?[indexPath.row]
        let name = recipeData?.label
        
        var dataViewModel: RecipeDataViewModel?
        
        switch indexPath.section {
        case 0:
            dataViewModel = RecipeDataViewModel(label: name, integrate: nil)
        case 1:
            dataViewModel = RecipeDataViewModel(label: nil, integrate: ingredient)
        default:
            print("")
        }
        cell.configureCell(recipeDataModel: dataViewModel)
        
    }
    
}
