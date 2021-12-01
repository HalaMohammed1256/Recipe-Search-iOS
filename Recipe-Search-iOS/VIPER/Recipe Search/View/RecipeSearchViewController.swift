


import UIKit
import JGProgressHUD

class RecipeSearchViewController: UIViewController {
    
    // variables
    var presenter: RecipeSearchPresenterProtocol?
    private let spinner = JGProgressHUD()
    var categorySelectedIndex = 0
    var searchControllerText: String?
            
    
    var searchController = UISearchController(searchResultsController: SearchHistoryRouter().createModule())
    
    // outlets
    @IBOutlet weak var noSearchResultScrollView: UIScrollView!
    @IBOutlet weak var noSearchResultStateLabel: UILabel!
    @IBOutlet weak var recipeSearchCategoryCollectionView: UICollectionView!
    @IBOutlet weak var recipeSearchResultTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureEllement()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }
            
    
    func configureEllement(){
        title = "Recipes Search"
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "What are you looking for?"
        noSearchResultStateLabel.text = "Type your recipe that you searching for"
        setupDelegatesAndCells()
    }
    
    func setupDelegatesAndCells(){
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        
        recipeSearchCategoryCollectionView.delegate = self
        recipeSearchCategoryCollectionView.dataSource = self
        
        recipeSearchResultTableView.delegate = self
        recipeSearchResultTableView.dataSource = self
        
        recipeSearchCategoryCollectionView.registerCell(cellClass: RecipeCategoryCollectionViewCell.self)
        recipeSearchResultTableView.registerCell(cellClass: RecipeResultTableViewCell.self)
        
    }

}


extension RecipeSearchViewController: RecipeSearchViewProtocol{    
    
    func searchResultDataVisability(isHidden: Bool, message: String){
        recipeSearchResultTableView.isHidden = isHidden
        noSearchResultScrollView.isHidden = !isHidden
        if isHidden && categorySelectedIndex != 0{
            recipeSearchCategoryCollectionView.isHidden = !isHidden
            noSearchResultStateLabel.text = "Your Search With Selected Filter Not Exist"
        }else{
            recipeSearchCategoryCollectionView.isHidden = isHidden
            noSearchResultStateLabel.text = message
        }
    }
    
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
        recipeSearchResultTableView.reloadData()
        recipeSearchCategoryCollectionView.reloadData()
    }    
}


extension RecipeSearchViewController: HistorySearchDelegationPattern{
    func searchByHistory(history: String) {
        searchController.searchBar.text = ""
        searchControllerText = history
        presenter?.getSearchResult(searchText: history, filter: nil)
    }
}
