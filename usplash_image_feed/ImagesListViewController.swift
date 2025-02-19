import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    let headers = ["Fruits", "Vegetables", "Berries"]
    let words = [["Apple", "Pear", "Watermelon"],
                 ["Carrot", "Pickle", "Potato", "Tomato"],
                 ["Strawberry", "Raspberry", "Blackberry", "Blueberry"],]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.sectionHeaderHeight = 32
        tableView.delegate = self
        tableView.dataSource = self
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let vegOrFruitArray = words[section]
        return vegOrFruitArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = words[indexPath.section][indexPath.row]
        cell.contentConfiguration = content
        let backgroundView = UIView()
        backgroundView.backgroundColor = .systemGreen
        cell.selectedBackgroundView = backgroundView
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let alert = UIAlertController(
            title: nil,
            message: "Вы нажали на \(words[indexPath.section][indexPath.row])",
            preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            alert.dismiss(animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
