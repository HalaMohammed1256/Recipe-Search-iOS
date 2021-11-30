

import UIKit
import JGProgressHUD

class RecipeDetailsViewController: UIViewController {
    
    // variables
    var recipeData: RecipeData?
    var presenter: RecipeDetailsPresenterProtocol?
    private let spinner = JGProgressHUD()
    let sectionName = ["Recipe Name", "Recipe Ingredient"]
    
    // outlets
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeDetailsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureEllement()
    }


    init() {
        super.init(nibName: String(describing: RecipeDetailsViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureEllement(){
        title = "Recipe Details"
        setupDelegatesAndCells()
        presenter?.viewDidLoad(withRecipeData: recipeData)
        if let image = recipeData?.image{
            recipeImageView.kf.indicatorType = .activity
            recipeImageView.kf.setImage(with: URL(string: image))
        }
    }
    
    func setupDelegatesAndCells(){
        recipeDetailsTableView.delegate = self
        recipeDetailsTableView.dataSource = self
        recipeDetailsTableView.tableFooterView = UIView(frame: CGRect.zero)
        recipeDetailsTableView.registerCell(cellClass: RecipeDetailsTableViewCell.self)
    }
    
    
    @IBAction func goToRecipeWebsiteTapped(_ sender: Any) {
        self.openInsideUrl(url_string: recipeData?.url)
    }
    
    
}


extension RecipeDetailsViewController: RecipeDetailsViewProtocol{
    
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
        recipeDetailsTableView.reloadData()
    }
    
    
}
