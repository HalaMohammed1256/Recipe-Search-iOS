//
//  RecipeDetailsPresenter.swift
//  Recipe-Search-iOS
//
//  Created by Hala on 30/11/2021.
//

import Foundation


class RecipeDetailsPresenter: RecipeDetailsPresenterProtocol, RecipeDetailsInteractorOutputProtocol {
    
    
    weak var view: RecipeDetailsViewProtocol?
    private var interactor: RecipeDetailsInteractorInputProtocol?
    private var router: RecipeDetailsRouterProtocol?
    private var recipeData: RecipeData?
    
    var numberOfIngredient: Int?{
        return recipeData?.ingredientLines?.count
    }
    
    init(view: RecipeDetailsViewProtocol, interactor: RecipeDetailsInteractorInputProtocol, router: RecipeDetailsRouterProtocol) {
        self.view = view
        self.interactor = interactor
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
