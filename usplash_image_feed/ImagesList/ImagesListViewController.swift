import UIKit

class ImagesListViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    
    
//    let headers = ["Fruits", "Vegetables", "Berries"]
//    let words = [["Apple", "Pear", "Watermelon"],
//                 ["Carrot", "Pickle", "Potato", "Tomato"],
//                 ["Strawberry", "Raspberry", "Blackberry", "Blueberry"],]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.sectionHeaderHeight = 32
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(named: "UsplashAppBlack") ?? .systemBlue
    }
}


extension ImagesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return headers[section]
//    }
    
    
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return words.count
//    }
    
}

extension ImagesListViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        
//        let alert = UIAlertController(
//            title: nil,
//            message: "Вы нажали на \(words[indexPath.section][indexPath.row])",
//            preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
//            alert.dismiss(animated: true)
//        }
//        alert.addAction(okAction)
//        present(alert, animated: true)
//    }
}
