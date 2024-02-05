//
//  SymbolViewController.swift
//  FinnHub
//
//  Created by Ali Siddiqui on 1/29/24.
//

import UIKit

class SymbolViewController: UIViewController, SymbolViewDelegate {
    
    
    private let _view = SymbolView()

    override func loadView() {
        super.loadView()
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Stock Data"
        _view.delegate = self

    }
    
    func NetworkCallReturnedInvalidresponse() {
        let alert = UIAlertController(title: "Invalid Symbol", message: "System Error", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            present(alert, animated: true)
    }
}

