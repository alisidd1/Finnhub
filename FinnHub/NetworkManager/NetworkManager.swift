//
//  NetworkManager.swift
//  FinnHub
//
//  Created by Ali Siddiqui on 1/29/24.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    
    //url = https://finnhub.io/api/v1/quote?symbol=goog&token=cmptmnpr01ql684rnvbgcmptmnpr01ql684rnvc0

    let baseURL = Constants.BASE_URL
    let apiKey = "cmptmnpr01ql684rnvbgcmptmnpr01ql684rnvc0"
    
    
    func getStockQuote(symbol: String, completion: @escaping(Result<StockAPIResponse, CustomErrors>) -> Void) {
        let endP = baseURL + "quote?symbol=" + symbol + "&token=" + apiKey
        guard let url = URL(string: endP) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard  error == nil else {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let apiRsponse = try decoder.decode(StockAPIResponse.self , from: data)
                print(apiRsponse as Any)
                completion(.success(apiRsponse))
            } catch DecodingError.dataCorrupted(let context) {
                print(context)
            } catch DecodingError.keyNotFound(let key, let context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch DecodingError.valueNotFound(let value, let context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
                completion(.failure(.nullValue))
                return
            } catch DecodingError.typeMismatch(let type, let context) {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
        }
        task.resume()
        
        
    }
}
