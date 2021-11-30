//
//  RecipeDetailsRouter.swift
//  Recipe-Search-iOS
//
//  Created by Hala on 30/11/2021.
//

import UIKit


class RecipeDetailsRouter: RecipeDetailsRouterProtocol {
    var viewController: UIViewController?
    
    func createModule() -> UIViewController {
        let view = RecipeDetailsViewController()
        let interactor = RecipeDetailsInteractor()
        let router = RecipeDetailsRouter()
        let presenter = RecipeDetailsPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.recipeDetailsOutput = presenter
        router.viewController = view
        return view
    }
}
