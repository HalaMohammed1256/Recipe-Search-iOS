//
//  RecipeResultTableViewCell.swift
//  Recipe-Search-iOS
//
//  Created by Hala on 28/11/2021.
//

import UIKit
import Kingfisher

class RecipeResultTableViewCell: UITableViewCell, RecipeSearchResultSearchCell {
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeSourceLabel: UILabel!
    @IBOutlet weak var recipeHealthLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(model: RecipeData) {
        if let image = model.image{
            recipeImageView.kf.indicatorType = .activity
            recipeImageView.kf.setImage(with: URL(string: image))
        }
        recipeNameLabel.text = model.label ?? "Recipe Name"
        recipeSourceLabel.text = model.source ?? "Recipe Source Label"
        let healthLabels = model.healthLabels?.joined().replacingOccurrences(of: ",", with: " ")
        recipeHealthLabel.text = healthLabels
        
    }
    
    
}
