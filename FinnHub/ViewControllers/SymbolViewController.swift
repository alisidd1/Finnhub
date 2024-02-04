//
//  SymbolViewController.swift
//  FinnHub
//
//  Created by Ali Siddiqui on 1/29/24.
//

import UIKit

class SymbolViewController: UIViewController {
    
    private let _view = SymbolView()

    override func loadView() {
        super.loadView()
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Stock Data"
        
          
    }
    

}

