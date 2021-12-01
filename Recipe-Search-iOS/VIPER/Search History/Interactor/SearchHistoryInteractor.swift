
import Foundation


class SearchHistoryInteractor: SearchHistoryInteractorInputProtocol {
    weak var outputPresenter: SearchHistoryInteractorOutputProtocol?
    let defaults = UserDefaults.standard
    
    func getSearchHistory(){
        if let histories = defaults.stringArray(forKey: Constants.historyArrayKey){
            outputPresenter?.searchHistoryFetchedSuccessfully(histories: histories)
        }else{
            outputPresenter?.searchHistoryFetchingFaield(withMessage: "You havn't any search history yet!")
        }
    }
}
