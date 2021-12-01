

import UIKit

extension UICollectionView{
    
    func registerCell<cell: UICollectionViewCell>(cellClass: cell.Type){
        self.register(UINib(nibName: String(describing: cell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: cell.self))
    }
        
}
