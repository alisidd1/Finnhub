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
        
//        NetworkManager.shared.getStockQuote(symbol: "AAPL") { [weak self] result in
//            switch result {
//            case .failure(let error):
//                print("Error: \(error)")
//                return
//            case .success(let data):
//                print(data)
//                self?._view.symbolData = data
//                DispatchQueue.main.async {
//                    self?._view.stockTable.reloadData()
//                }
//            }
//            
//        }
        
    }
}
