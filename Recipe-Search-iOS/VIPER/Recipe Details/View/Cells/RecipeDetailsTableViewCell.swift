

import UIKit

class RecipeDetailsTableViewCell: UITableViewCell, configureRecipDetailsCellProtocol, configureSearchHistoryCellProtocol {
    

    @IBOutlet weak var recipeDetailsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(recipeDataModel: RecipeDataViewModel?) {
        if let name = recipeDataModel?.label{
            recipeDetailsLabel.text = name
        }
        if let ingredient = recipeDataModel?.ingredient{
            recipeDetailsLabel.text = ingredient
        }
    }
    
    func configure(history: String) {
        recipeDetailsLabel.text = history
    }
    
}
