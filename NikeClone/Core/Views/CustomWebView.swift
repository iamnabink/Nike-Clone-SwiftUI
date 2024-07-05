//
//  CustomWebView.swift
//  NikeClone
//
//  Created by Nabraj Khadka on 03/06/2024.
//

import SwiftUI
import WebKit

struct CustomWebView: UIViewRepresentable {
    @ObservedObject var webViewModel: WebViewModel
    
    func makeUIView(context: Context) -> WKWebView {
            guard let url = URL(string: self.webViewModel.url) else {
                return WKWebView()
            }
            
            let request = URLRequest(url: url)
            let webView = WKWebView()
            webView.navigationDelegate = context.coordinator
            webView.load(request)
            
            return webView
        }
        
        func updateUIView(_ uiView: WKWebView, context: Context) {
            if webViewModel.shouldGoBack {
                uiView.goBack()
                webViewModel.shouldGoBack = false
            }
        }
    
    func makeCoordinator() -> CustomWebView.Coordinator {
            Coordinator(self, webViewModel)
        }
    
}



extension CustomWebView {
    class Coordinator: NSObject, WKNavigationDelegate {
        @ObservedObject private var webViewModel: WebViewModel
        private let parent: CustomWebView
        
        init(_ parent: CustomWebView, _ webViewModel: WebViewModel) {
            self.parent = parent
            self.webViewModel = webViewModel
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            webViewModel.isLoading = true
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webViewModel.isLoading = false
            webViewModel.title = webView.title ?? ""
            webViewModel.canGoBack = webView.canGoBack
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            webViewModel.isLoading = false
        }
    }
}


class WebViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var canGoBack: Bool = false
    @Published var shouldGoBack: Bool = false
    @Published var title: String = ""
    
    var url: String
    
    // init(_ url: String) '_' to omit params name like WebViewModel(url:"") to WebViewModel("")
    init(url: String) {
        self.url = url
    }
}
