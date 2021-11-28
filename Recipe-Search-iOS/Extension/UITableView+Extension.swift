//
//  UITableView+Extension.swift
//  Recipe-Search-iOS
//
//  Created by Hala on 28/11/2021.
//

import UIKit


extension UITableView{

    func registerCell<cell: UITableViewCell>(cellClass: cell.Type){
        
        self.register(UINib(nibName: String(describing: cell.self), bundle: nil), forCellReuseIdentifier: String(describing: cell.self))
    }

}
