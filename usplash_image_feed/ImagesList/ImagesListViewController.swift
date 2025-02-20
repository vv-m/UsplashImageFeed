import UIKit

class ImagesListViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    
    private let photosName: [String] = Array(0..<20).map{ "\($0)" }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(named: "UsplashAppBlack") ?? .systemBlue
//        tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
    }
}


extension ImagesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImagesListCell.reuseIdentifier, for: indexPath)
        
        guard let imageListCell = cell as? ImagesListCell else {
            return UITableViewCell()
        }
        configCell(for: imageListCell, with: indexPath)
        return imageListCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosName.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let widthTableView = tableView.bounds.width - 32
            
        guard let image = UIImage(named: photosName[indexPath.row]),
              image.size.width > 0 else {
            return 200
        }
        let imageInsets = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        let imageWidth = image.size.width
//        print("imageWidth = \(imageWidth)")
        let ratio = widthTableView / image.size.width
        print("ratio = \(ratio)")
        let adaptiveHight = image.size.height * ratio
//        print("adaptiveHight for section \(indexPath.row) = \(adaptiveHight)")
        return adaptiveHight + 8
    }
    
    func configCell(for cell: ImagesListCell, with indexPath: IndexPath) {
        guard let image = UIImage(named: photosName[indexPath.row]) else {
                    return
                }
        cell.cellImage.image = image
        cell.cellImage.layer.cornerRadius = 16
        cell.cellImage.layer.masksToBounds = true
        cell.backgroundColor = UIColor(named: "UsplashAppBlack") ?? .systemBlue
        
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return headers[section]
//    }
    
    
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return words.count
//    }
    
}

extension ImagesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
//        let alert = UIAlertController(
//            title: nil,
//            message: "Вы нажали на \(words[indexPath.section][indexPath.row])",
//            preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
//            alert.dismiss(animated: true)
//        }
//        alert.addAction(okAction)
//        present(alert, animated: true)
    }
}
