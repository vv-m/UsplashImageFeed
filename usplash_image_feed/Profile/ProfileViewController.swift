import UIKit

final class ProfileViewController: UIViewController {
    private var photo: UIImageView!
    private var nameUserLabel: UILabel!
    private var loginUserLabel: UILabel!
    private var textUserLabel: UILabel!
    private var exitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewPhoto()
        viewName()
        viewLoginUserLabel()
        viewTextUserLabel()
        viewExitButton()
    }
    
    private func viewPhoto() {
        photo = UIImageView(image: UIImage(named: "Photo"))
        view.addSubview(photo)
        photo.translatesAutoresizingMaskIntoConstraints = false
        
        photo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        photo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        photo.widthAnchor.constraint(equalToConstant: 70).isActive = true
        photo.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    private func viewName() {
        nameUserLabel = UILabel()
        view.addSubview(nameUserLabel)
        nameUserLabel.translatesAutoresizingMaskIntoConstraints = false
        nameUserLabel.text = "Екатерина Новикова"
        nameUserLabel.textColor = .white
        nameUserLabel.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        
        nameUserLabel.leadingAnchor.constraint(equalTo: photo.leadingAnchor).isActive = true
        nameUserLabel.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 8).isActive = true
    }
    
    private func viewLoginUserLabel() {
        loginUserLabel = UILabel()
        view.addSubview(loginUserLabel)
        loginUserLabel.translatesAutoresizingMaskIntoConstraints = false
        loginUserLabel.text = "@ekaterina_nov"
        loginUserLabel.textColor = UIColor(red: 174/255, green: 175/255, blue: 180/255, alpha: 1.0)
        loginUserLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        
        loginUserLabel.leadingAnchor.constraint(equalTo: photo.leadingAnchor).isActive = true
        loginUserLabel.topAnchor.constraint(equalTo: nameUserLabel.bottomAnchor, constant: 8).isActive = true
    }
    
    private func viewTextUserLabel() {
        textUserLabel = UILabel()
        view.addSubview(textUserLabel)
        textUserLabel.translatesAutoresizingMaskIntoConstraints = false
        textUserLabel.text = "Hello, world!"
        textUserLabel.textColor = .white
        textUserLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        
        textUserLabel.leadingAnchor.constraint(equalTo: photo.leadingAnchor).isActive = true
        textUserLabel.topAnchor.constraint(equalTo: loginUserLabel.bottomAnchor, constant: 8).isActive = true
    }
    
    private func viewExitButton() {
        exitButton = UIButton()
        view.addSubview(exitButton)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.setImage(UIImage(named: "Exit"), for: .normal)
        
        exitButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
        exitButton.centerYAnchor.constraint(equalTo: photo.centerYAnchor).isActive = true
        exitButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        exitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
}
