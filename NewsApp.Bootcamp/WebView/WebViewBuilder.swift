//
//  WebViewBuilder.swift
//  NewsApp.Bootcamp
//
//  Created by Mert Karahan on 18.09.2022.
//

import Foundation

// Detail WebViewController
struct WebViewBuilder {
    static func buildWebView(url: String) -> WebViewController {
        let webViewModel = WebViewModel(urlFromDetail: url)
        let webViewController = WebViewController()
        webViewController.webViewModel = webViewModel
        
        return webViewController
    }
}

