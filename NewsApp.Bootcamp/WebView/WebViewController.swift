//
//  WebViewController.swift
//  NewsApp.Bootcamp
//
//  Created by Mert Karahan on 18.09.2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate{

    @IBOutlet weak var webView: WKWebView!
    
    var webViewModel : WebViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestForUrl()
        webView.navigationDelegate = self
    }
    
//    Function for visiting url
    func requestForUrl() {
        let url = URL(string:webViewModel?.urlFromDetail ?? "www.google.com")
        let request = URLRequest(url: url!)
        webView.load(request)
        
    }
}
