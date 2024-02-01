//
//  Constants.swift
//  FinnHub
//
//  Created by Ali Siddiqui on 1/29/24.
//
// https://finnhub.io/api/v1/quote?symbol=goog&token=cmptmnpr01ql684rnvbgcmptmnpr01ql684rnvc0



import UIKit

struct Constants {
    static let BASE_URL = "https://finnhub.io/api/v1/"
    static let BASE_SOCKET_URL = "wss://ws.finnhub.io"
    static var API_KEY: String  = "cmptmnpr01ql684rnvbgcmptmnpr01ql684rnvc0"
}

public enum FinnhubWebError: Error {
    case networkFailure(Error)
    case invalidData
}

public enum FinnhubLiveError: Error {
    case networkFailure(Error)
    case unknownFailure
    case invalidData
}

public enum FinnhubLiveSuccess {
    case trades
    case news
    case ping
    case empty
}
