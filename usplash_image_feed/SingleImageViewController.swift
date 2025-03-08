import UIKit

final class SingleImageViewController: UIViewController {
    var image: UIImage? {
        didSet {
            guard isViewLoaded, let image else {
                return
            }
            imageView.image = image
            imageView.frame.size = image.size
            rescaleAndCenterImageInScrollView(image: image)
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet private var imageView: UIImageView!
    
    @IBAction func didTapBackButton(_ sender: UIButton) {
        print("Pressed button")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapShareButton(_ sender: Any) {
        print("pressed the share button")
        guard let image else {
            return
        }
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        present(activityViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Конфигурируем scrollView
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 1.25
        
        // Устанавливаем изображение
        guard let image else { return }
        imageView.image = image
        imageView.frame.size = image.size
        rescaleAndCenterImageInScrollView(image: image)
    }
    
    /// Масштабирует и центрирует изображение в ScrollView
    private func rescaleAndCenterImageInScrollView(image: UIImage) {
        // Получаем минимальный и максимальный масштаб из ScrollView
        let minZoomScale = scrollView.minimumZoomScale
        let maxZoomScale = scrollView.maximumZoomScale
        
        // Обновляем макет представления, чтобы получить актуальные размеры
        view.layoutIfNeeded()
        
        // Получаем видимую область ScrollView
        let visibleRectSize = scrollView.bounds.size
        print("visibleRectSize.width \(visibleRectSize.width)")
        print("visibleRectSize.height \(visibleRectSize.height)")
        
        // Получаем размер изображения
        let imageSize = image.size
        print("imageSize.width \(imageSize.width)")
        print("visibleRectSize.height \(imageSize.height)")
        
        // Вычисляем коэффициенты масштабирования по ширине и высоте
        // Это нужно, чтобы изображение поместилось в видимую область
        let hScale = (visibleRectSize.width / imageSize.width)
        let vScale = visibleRectSize.height / imageSize.height
        print("hScale \(hScale)")
        print("vScale \(vScale)")
        
        // Выбираем наименьший масштаб, чтобы изображение целиком поместилось на экране,
        // но при этом не выходило за пределы допустимых значений масштаба
        let scale = min(maxZoomScale, max(minZoomScale, min(hScale, vScale)))
        print("scale \(scale)")
        
        // Устанавливаем вычисленный масштаб
        scrollView.setZoomScale(scale, animated: true)
        
        // Обновляем макет ScrollView, чтобы применить новый масштаб
        scrollView.layoutIfNeeded()
        
        // Получаем новый размер контента после масштабирования
        let newContentSize = scrollView.contentSize
        
        // Вычисляем смещение для центрирования изображения
        let x = (newContentSize.width - visibleRectSize.width) / 2
        let y = (newContentSize.height - visibleRectSize.height) / 2
        // Устанавливаем смещение контента для центрирования изображения
        scrollView.setContentOffset(CGPoint(x: x, y: y), animated: true)
    }
}


extension SingleImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
