

import UIKit

extension RecipeSearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfSearchResultRow ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RecipeResultTableViewCell.self)) as? RecipeResultTableViewCell else{
            return UITableViewCell()
        }
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
        
        presenter?.configureResult(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = RecipeDetailsRouter().createModule() as! RecipeDetailsViewController
        viewController.recipeData = presenter?.getRecipDetails(indexPath: indexPath)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
