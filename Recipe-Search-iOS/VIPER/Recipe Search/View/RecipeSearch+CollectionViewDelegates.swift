//
//  RecipeSearch+CollectionViewDelegates.swift
//  Recipe-Search-iOS
//
//  Created by Hala on 28/11/2021.
//

import UIKit

extension RecipeSearchViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: RecipeCategoryCollectionViewCell.self), for: indexPath) as? RecipeCategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    
}
