//
//  WebViewViewModel.swift
//  XcodeUpdates
//
//  Created by Fabrício Masiero on 14/02/20.
//  Copyright © 2020 Fabrício Masiero. All rights reserved.
//

import Foundation
import WebKit

public class WebViewViewModel: NSObject {
    
    let releaseNotesUrl: String?
    
    let webView: WKWebView
    
    init(releaseNotesUrl: String?) {
        self.releaseNotesUrl = releaseNotesUrl
        self.webView = WKWebView()
    }
    
    public func request() {
        guard let releaseNotesUrlString = releaseNotesUrl, let url = URL(string: releaseNotesUrlString) else {
            return
        }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
        if webView.navigationDelegate == nil {
            webView.navigationDelegate = self
        }
    }
}
extension WebViewViewModel: WKNavigationDelegate {
    public func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
    }
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
}
