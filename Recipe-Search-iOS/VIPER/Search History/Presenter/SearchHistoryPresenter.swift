

import Foundation


class SearchHistoryPresenter: SearchHistoryPresenterProtocol, SearchHistoryInteractorOutputProtocol {
    
    weak var view: SearchHistoryViewProtocol?
    private var interactor: SearchHistoryInteractorInputProtocol?
    private var router: SearchHistoryRouterProtocol?
    private var histories = [String]()
    
    
    init(view: SearchHistoryViewProtocol, interactor: SearchHistoryInteractorInputProtocol, router: SearchHistoryRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    var numberOfHistory: Int{
        return histories.count
    }
    
    func getSearchHistory() {
        view?.showLoadingIndicator()
        interactor?.getSearchHistory() 
    }
    
    func getSearchHistoryText(indexPath: IndexPath) -> String{
        return histories[indexPath.row]
    }
    
    func ConfigureHistory(cell: configureSearchHistoryCellProtocol, indexPath: IndexPath) {
        let history = histories[indexPath.row]
        cell.configure(history: history)
    }
    
    func searchHistoryFetchedSuccessfully(histories: [String]) {
        view?.hideLoadingIndicator()
        self.histories = histories
        view?.reloadData()
    }
    
    func searchHistoryFetchingFaield(withMessage message: String) {
        view?.hideLoadingIndicator()
    }
    
}
