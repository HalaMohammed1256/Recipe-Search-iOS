

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

    func configureEllement(){
        title = "Recipe Details"
        setupDelegatesAndCells()
        presenter?.viewDidLoad(withRecipeData: recipeData)
        if let image = recipeData?.image{
            recipeImageView.kf.indicatorType = .activity
            recipeImageView.kf.setImage(with: URL(string: image))
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    func setupDelegatesAndCells(){
        recipeDetailsTableView.delegate = self
        recipeDetailsTableView.dataSource = self
        recipeDetailsTableView.tableFooterView = UIView(frame: CGRect.zero)
        recipeDetailsTableView.registerCell(cellClass: RecipeDetailsTableViewCell.self)
    }
    
    
    @objc func shareTapped(){
        guard let recipeURL = recipeData?.url else{ return }
        shareData(data: [recipeURL], barButtonItem: navigationItem.rightBarButtonItem)
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
