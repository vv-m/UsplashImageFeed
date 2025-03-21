import UIKit
@preconcurrency import WebKit

protocol WebViewViewControllerDelegate: AnyObject {
    func webViewViewController(_ vc: WebViewViewController, didAuthenticateWithCode code: String)
    func webViewViewControllerDidCancel(_ vc: WebViewViewController)
}

enum WebViewConstants {
    static let unsplashAuthorizeURLString = "https://unsplash.com/oauth/authorize"
}

class WebViewViewController: UIViewController {
    @IBOutlet private var webView: WKWebView!
    @IBOutlet weak var progressView: UIProgressView!
    
    weak var delegate: WebViewViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        loadAuthView()
    }
    
    
    private func loadAuthView(){
        guard var urlComponents = URLComponents(string: WebViewConstants.unsplashAuthorizeURLString) else {
            print("Could not create URLComponents")
            return
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: Constants.accessKey),
            URLQueryItem(name: "redirect_uri", value: Constants.redirectURI),
            URLQueryItem(name: "response_type", value: "code"),
            URLQueryItem(name: "scope", value: Constants.accessScope)
        ]
        
        guard let url = urlComponents.url else {
            print("Could not get url from URLComponents")
            return
        }
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

extension WebViewViewController: WKNavigationDelegate {
    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationAction: WKNavigationAction,
        decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
    ) {
        if let code = code(from: navigationAction) {
            print("webView запустилась")
            delegate?.webViewViewController(self, didAuthenticateWithCode: code)
            decisionHandler(.cancel)
        } else {
            print("allow")
            decisionHandler(.allow)
        }
    }
    
    private func code(from navigationAction: WKNavigationAction) -> String? {
        guard let url = navigationAction.request.url else {
            print("Условие 1 не выполнено: URL не найден")
            return nil
        }
        print("url \(url)")
        
        guard let urlComponents = URLComponents(string: url.absoluteString) else {
            print("Условие 2 не выполнено: Невозможно создать URLComponents из URL")
            return nil
        }
        print("url \(urlComponents)")
        print("url \(urlComponents.path)")
        guard urlComponents.path == "/oauth/authorize/native" else {
            print("Условие 3 не выполнено: Путь URL не соответствует '/oauth/authorize/native'")
            return nil
        }
        
        guard let items = urlComponents.queryItems else {
            print("Условие 4 не выполнено: Нет queryItems в URLComponents")
            return nil
        }
        
        guard let codeItem = items.first(where: { $0.name == "code" }) else {
            print("Условие 5 не выполнено: queryItem с именем 'code' не найден")
            return nil
        }
        
        let code_value = codeItem.value
        print("Код авторизации \(code_value)")
        return codeItem.value
    }
}
