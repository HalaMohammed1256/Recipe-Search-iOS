

import UIKit
import JGProgressHUD

class SearchHistoryViewController: UIViewController {
    
    var presenter: SearchHistoryPresenterProtocol?
    var historySearchProtocol: HistorySearchDelegationPattern?
    private let spinner = JGProgressHUD()
    
    @IBOutlet weak var searchResultTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureEllement()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.getSearchHistory()
    }

    func configureEllement(){
        setupDelegatesAndCells()
        presenter?.getSearchHistory()
    }

    func setupDelegatesAndCells(){
        searchResultTableView.delegate = self
        searchResultTableView.dataSource = self
        searchResultTableView.tableFooterView = UIView(frame: CGRect.zero)
        searchResultTableView.registerCell(cellClass: RecipeDetailsTableViewCell.self)
    }


}


extension SearchHistoryViewController: SearchHistoryViewProtocol{
    
    func showAlert(message: String) {
        showAlert(title: nil, message: message, style: .alert, okName: "OK", okHandler: nil, cancelName: "Cancel", cancelHandler: nil, isShowCancel: true)
    }
    
    func showLoadingIndicator() {
        spinner.show(in: self.view)
    }
    
    func hideLoadingIndicator() {
        spinner.dismiss()
    }
    
    func reloadData() {
        searchResultTableView.reloadData()
    }
}
