//
//  SymbolRealTimeQuoteViewModel.swift
//  FinnHub
//
//  Created by Ali Siddiqui on 2/13/24.
//

import UIKit

struct SymbolRealTimeQuoteViewModel: Codable {
    var symbol: String
    var lastPrice: Double
    var timeStamp: Double
    var volume: Double
    
    enum CodingKeys: String, CodingKey {
        case symbol = "s"
        case lastPrice = "p"
        case timeStamp = "t"
        case volume = "v"
    }
}
