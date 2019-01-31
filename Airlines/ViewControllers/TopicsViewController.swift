//
//  TopicsViewController.swift
//  Airlines
//
//  Created by Huchchappa, Abhilasha on 1/30/19.
//  Copyright © 2019 Huchchappa, Abhilasha. All rights reserved.
//

import UIKit

class TopicsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.hidesBackButton = true
        self.tabBarController?.navigationItem.title = "Topics"
    }

}
