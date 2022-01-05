//
//  OrderingViewController.swift
//  Smart Pantry
//
//  Created by Anthony Jones on 1/28/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit
import WebKit

class OrderingViewController: UIViewController {

    @IBOutlet weak var myWebKit: WKWebView!
    let url = URL(string: "https://grocery.walmart.com/locations/delivery/Walmart-Morgantown-WV-Supercenter-2083")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = URLRequest(url: url!)
        myWebKit.allowsBackForwardNavigationGestures = true
        myWebKit.load(request)
    }

}
