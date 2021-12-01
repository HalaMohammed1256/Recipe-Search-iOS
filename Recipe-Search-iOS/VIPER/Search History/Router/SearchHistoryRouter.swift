
import UIKit

class SearchHistoryRouter: SearchHistoryRouterProtocol {
    weak var viewController: UIViewController?
    
    func createModule() -> UIViewController {
        let view = SearchHistoryViewController()
        let interactor = SearchHistoryInteractor()
        let router = SearchHistoryRouter()
        let presenter = SearchHistoryPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.outputPresenter = presenter
        router.viewController = view
        return view
    }
}
