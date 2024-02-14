//
//  SymbolDetailViewModel.swift
//  FinnHub
//
//  Created by Ali Siddiqui on 1/29/24.
//

import UIKit
struct SymbolDetailViewModel: Codable {
    var data: [Trade]
    let type: String
}

struct Trade: Codable {
    var c: [String]
    var p: Double
    var s: String
    var t: Int
    var v: Int
}

extension Trade {
    enum CodingKeys: String, CodingKey {
        case c
        case p
        case s
        case t
        case v
    }
}

extension SymbolDetailViewModel {
    enum CodingKeys: String, CodingKey {
        case data
        case type
    }
}


