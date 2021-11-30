


import UIKit
import JGProgressHUD

class RecipeSearchViewController: UIViewController {
    
    // variables
    var presenter: RecipeSearchPresenterProtocol?
    private let spinner = JGProgressHUD()
        
    
    // outlets
    @IBOutlet weak var recipeSearchBar: UISearchBar!
    @IBOutlet weak var noSearchResultScrollView: UIScrollView!
    @IBOutlet weak var noSearchResultStateLabel: UILabel!
    @IBOutlet weak var recipeSearchCategoryCollectionView: UICollectionView!
    @IBOutlet weak var recipeSearchResultTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configureEllement()

    }


    init() {
        super.init(nibName: String(describing: RecipeSearchViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureEllement(){
        title = "Recipes Search"
        noSearchResultStateLabel.text = "Type your recipe that you searching for"
        setupDelegatesAndCells()
    }
    
    func setupDelegatesAndCells(){
        recipeSearchBar.delegate = self
        
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
        recipeSearchCategoryCollectionView.isHidden = isHidden
        noSearchResultScrollView.isHidden = !isHidden
        noSearchResultStateLabel.text = message
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
    }    
}
