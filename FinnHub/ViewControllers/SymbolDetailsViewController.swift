//
//  SymbolDetailsViewController.swift
//  FinnHub
//
//  Created by Ali Siddiqui on 1/29/24.
//

import UIKit

class SymbolDetailsViewController: UIViewController {
    private let _view = SymbolDetailView()

    override func loadView() {
        super.loadView()
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Symbol Details"


    }


}
