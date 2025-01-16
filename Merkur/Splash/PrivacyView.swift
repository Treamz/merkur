//
//  PrivacyView.swift
//  Merkur
//
//  Created by Ivan Chernoknizhikov on 15.01.2025.
//

import Foundation
import SwiftUI
import WebKit

struct PrivacyView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
