

import UIKit

class RecipeDetailsViewController: UIViewController {
    
    // variables
    
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
        setupDelegatesAndCells()
    }
    
    func setupDelegatesAndCells(){
        recipeDetailsTableView.delegate = self
        recipeDetailsTableView.dataSource = self
        recipeDetailsTableView.registerCell(cellClass: RecipeResultTableViewCell.self)
    }
    
    
    @IBAction func goToRecipeWebsiteTapped(_ sender: Any) {
        self.openInsideUrl(url_string: "")
    }
    
    
}
