

import UIKit


class RecipeDetailsRouter: RecipeDetailsRouterProtocol {
    var viewController: UIViewController?
    
    func createModule() -> UIViewController {
        let view = RecipeDetailsViewController()
        let router = RecipeDetailsRouter()
        let presenter = RecipeDetailsPresenter(view: view, router: router)
        view.presenter = presenter
        router.viewController = view
        return view
    }
}
