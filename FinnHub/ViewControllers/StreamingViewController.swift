//
//  StreamingViewController.swift
//  FinnHub
//
//  Created by Ali Siddiqui on 2/1/24.
//

import UIKit

class StreamingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        title = "Streaming Data"

        let customTabBarItem = UITabBarItem(title: "Streaming Data", image: nil, selectedImage: nil)
        self.tabBarItem = customTabBarItem

    }
}
