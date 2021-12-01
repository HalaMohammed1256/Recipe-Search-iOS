

import UIKit

extension RecipeSearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfCategoryItem ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: RecipeCategoryCollectionViewCell.self), for: indexPath) as? RecipeCategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        presenter?.configureCategory(cell: cell, indexPath: indexPath)
        if indexPath.row == categorySelectedIndex{
            cell.borderColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        }else{
            cell.borderColor = .clear
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if categorySelectedIndex != indexPath.row{
            let previous_index = IndexPath(item: categorySelectedIndex, section: 0)
            collectionView.cellForItem(at: previous_index)?.borderColor = .clear
            categorySelectedIndex = indexPath.row
            collectionView.cellForItem(at: indexPath)?.borderColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        } 
        let filter = presenter?.categories[indexPath.row].filterAPIName
        presenter?.getSearchResult(searchText: searchControllerText ?? "", filter: filter)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let label = UILabel(frame: CGRect.zero)
        label.text = presenter?.getCategoryName(indexPath: indexPath)
        label.sizeToFit()
        
        return CGSize(width: (label.frame.width + 40), height: label.frame.height + 20)
    }
    
}
