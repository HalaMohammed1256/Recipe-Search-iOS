//
//  RecipeCategoryCollectionViewCell.swift
//  Recipe-Search-iOS
//
//  Created by Hala on 28/11/2021.
//

import UIKit

class RecipeCategoryCollectionViewCell: UICollectionViewCell, RecipeSearchCategorySearchCellProtocol {
    
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(model: RecipeCategory) {
        categoryNameLabel.text = model.name
    }

}
