import UIKit

class SingleImageViewController: UIViewController {
    var image: UIImage? {
        didSet {
            guard isViewLoaded else {
                return
            }
            imageView.image = image
        }
    }
    
    
    @IBAction func didTapBackButton(_ sender: UIButton) {
        print("Pressed button")
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet private var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }
}
