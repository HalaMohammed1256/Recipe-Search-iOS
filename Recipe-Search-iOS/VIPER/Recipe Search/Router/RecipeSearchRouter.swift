

import UIKit

class RecipeSearchRouter: RecipeSearchRouterProtocol {
     
    weak var viewController: UIViewController?
        
    static func createModule() -> UIViewController {
        let view = RecipeSearchViewController()
        let interactor = RecipeSearchInteractor()
        let router = RecipeSearchRouter()
        let presenter = RecipeSearchPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.recipeSearchOutput = presenter
        router.viewController = view
        return view
    }
        
}
