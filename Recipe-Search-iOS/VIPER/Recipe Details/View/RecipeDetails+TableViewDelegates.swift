//
//  RecipeDetails+TableViewDelegates.swift
//  Recipe-Search-iOS
//
//  Created by Hala on 28/11/2021.
//

import UIKit


extension RecipeDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return recipeData?.ingredientLines?.count ?? 0
        default:
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionName[section]
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        let view = UIView()
//        view.backgroundColor = #colorLiteral(red: 0.8521431684, green: 0.8521431684, blue: 0.8521431684, alpha: 1)
//
//        let label = UILabel(frame: CGRect(x: 16, y: 8, width: tableView.bounds.width, height: 25))
//        label.text = sectionName[section]
//        label.textAlignment = .natural
//        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
//        view.addSubview(label)
//
//        return view
//
//    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 64
//    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RecipeDetailsTableViewCell.self)) as? RecipeDetailsTableViewCell else {
            return UITableViewCell()
        }
        presenter?.configureIntegration(cell: cell, indexPath: indexPath)
        return cell
    }
}
