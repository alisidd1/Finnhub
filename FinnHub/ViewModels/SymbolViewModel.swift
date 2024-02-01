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


/*
 
 {
   "c": 154.84,
   "d": 1.05,
   "dp": 0.6827,
   "h": 155.2,
   "l": 152.94,
   "o": 153.54,
   "pc": 153.79,
   "t": 1706486400
 }
 */
