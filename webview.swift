import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let htmlFilename: String

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        // Configure preferences if needed:
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.scrollView.alwaysBounceVertical = true

        // Load local HTML from the app bundle
        if let url = Bundle.main.url(forResource: htmlFilename, withExtension: "html") {
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        } else {
            // Simple fallback content if file not found
            webView.loadHTMLString("<html><body><h1>Missing \(htmlFilename).html</h1></body></html>", baseURL: nil)
        }

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // Nothing dynamic to update for now
    }
}
