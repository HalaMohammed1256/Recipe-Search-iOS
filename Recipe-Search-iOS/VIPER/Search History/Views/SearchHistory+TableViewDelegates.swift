

import UIKit


extension SearchHistoryViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfHistory ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RecipeDetailsTableViewCell.self)) as? RecipeDetailsTableViewCell else{
            return UITableViewCell()
        }
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
        presenter?.ConfigureHistory(cell: cell, indexPath: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let history = presenter?.getSearchHistoryText(indexPath: indexPath){
            historySearchProtocol?.searchByHistory(history: history)
            dismiss(animated: true, completion: nil)
        }
    }

}
