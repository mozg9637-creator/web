import SwiftUI
import UIKit
import WebKit

struct ContentView: View {
    private let siteURL = "https://chiguredder.tiiny.site/"

    var body: some View {
        WebView(urlString: siteURL)
            .ignoresSafeArea()
            .navigationTitle("Chigur")
    }
}

struct WebView: UIViewRepresentable {
    let urlString: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: urlString) else { return }
        if uiView.url != url {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    final class Coordinator: NSObject, WKNavigationDelegate {
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}

#Preview {
    ContentView()
}
