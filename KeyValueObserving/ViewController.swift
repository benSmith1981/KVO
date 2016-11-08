//
//  ViewController.swift
//  KeyValueObserving
//
//  Created by Ben Smith on 08/11/16.
//  Copyright © 2016 Ben Smith. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.webView = WKWebView()

        self.view = self.webView
        
        self.webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        
        self.loadWebPage()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func loadWebPage() {
        let url = NSURLRequest(url: URL(string: "https://www.google.com")!)
        self.webView.load(url as URLRequest)
    }
    
    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {

        if (keyPath == "estimatedProgress") {
            // TODO
            print("Loading \(self.webView.estimatedProgress * 100)%")
        }

    }

}

