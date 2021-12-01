

import UIKit


protocol SearchHistoryViewProtocol: AnyObject {
    var presenter: SearchHistoryPresenterProtocol? { get set }
    func showAlert(message: String)
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func reloadData()
}

protocol SearchHistoryPresenterProtocol: AnyObject {
    var view: SearchHistoryViewProtocol? { get set }
    var numberOfHistory: Int { get }
    func getSearchHistory()
    func getSearchHistoryText(indexPath: IndexPath) -> String
    func ConfigureHistory(cell: configureSearchHistoryCellProtocol, indexPath: IndexPath)
}

protocol SearchHistoryRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    func createModule() -> UIViewController
}

protocol SearchHistoryInteractorInputProtocol: AnyObject {
    var outputPresenter: SearchHistoryInteractorOutputProtocol? { get set }
    func getSearchHistory()
}

protocol SearchHistoryInteractorOutputProtocol: AnyObject {
    func searchHistoryFetchedSuccessfully(histories: [String])
    func searchHistoryFetchingFaield(withMessage message: String)
}

protocol configureSearchHistoryCellProtocol {
    func configure(history: String)
}
