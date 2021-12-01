

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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RecipeDetailsTableViewCell.self)) as? RecipeDetailsTableViewCell else {
            return UITableViewCell()
        }
        presenter?.configureIntegration(cell: cell, indexPath: indexPath)
        return cell
    }
}
