//
//  CustomWebView.swift
//  NikeClone
//
//  Created by nex on 03/06/2024.
//

import SwiftUI
import WebKit

struct CustomWebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
         WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

