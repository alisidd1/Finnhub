//
//  SymbolViewModel.swift
//  FinnHub
//
//  Created by Ali Siddiqui on 1/29/24.
//

import UIKit
struct StockAPIResponse: Codable {
    var close: Double
    var dailyGain: Double
    var dailyPercent: Double
    var high: Double
    var low: Double
    var open: Double
    var pervClose: Double
    var totalVolume: Double
          
    enum CodingKeys: String, CodingKey {
          case close = "c"
          case dailyGain = "d"
          case dailyPercent = "dp"
          case high = "h"
          case low = "l"
          case open = "o"
          case pervClose  = "pc"
          case totalVolume = "t"
    }
}



