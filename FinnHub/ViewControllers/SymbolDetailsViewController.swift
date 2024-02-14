//
//  SymbolDetailViewController.swift
//  FinnHub
//
//  Created by Ali Siddiqui on 1/29/24.
//
// wss://ws.finnhub.io?token=mytoken
// url = https://finnhub.io/api/v1/quote?symbol=goog&token=cmptmnpr01ql684rnvbgcmptmnpr01ql684rnvc0
// wss://ws.finnhub.io?token=cmptmnpr01ql684rnvbgcmptmnpr01ql684rnvc0
// https://finnhub.io/docs/api/websocket-trades

import UIKit

class SymbolDetailViewController: UIViewController, URLSessionWebSocketDelegate {
    private let _view = SymbolDetailView()
    private var webSocket: URLSessionWebSocketTask?

    override func loadView() {
        super.loadView()
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Symbol Details"

        let session = URLSession(configuration: .default,
                                 delegate: self,
                                 delegateQueue: OperationQueue())

        let url = URL(string: "wss://ws.finnhub.io?token=cmptmnpr01ql684rnvbgcmptmnpr01ql684rnvc0")
        webSocket = session.webSocketTask(with: url!)
        webSocket?.resume()
        
    }

    func ping() {
        print("In Ping method")
        webSocket?.sendPing(pongReceiveHandler: { error in
            if let error = error {
                print("Ping Error: \(error)")
            }
        })
    }
    
    func close() {
        print("In Close method")
        webSocket?.cancel(with: .goingAway, reason: "No data needed".data(using: .utf8))
    }
    
    func send() {
        print("In Send method")
        let string = "{\"type\":\"subscribe\",\"symbol\":\"GOOG\"}"
        let message = URLSessionWebSocketTask.Message.string(string)
        self.webSocket?.send(message) { error in
            if let error = error {
                print("send Error: \(error)")
            } else {
                print("webSocket?.send - No Error")
            }
        }
    }
    
    func receive() {
        print("In Receieve method")
        var tickerPrice = SymbolDetailViewModel.init(data: [Trade](), type: "")
            //symbol: "", lastPrice: 0, timeStamp: 0, volume: 0)

         webSocket?.receive(completionHandler: { [weak self] result in
             switch result{
             case .success(let message):
                 switch(message) {
                 case .data(_):
                     print(message)
                 case .string(let str):
   //                  print(str)
                     let jsonData = Data(str.utf8)
                     do {
                         let decoder = JSONDecoder()
                         let result = try decoder.decode(SymbolDetailViewModel.self, from: jsonData)
                         DispatchQueue.main.async{
                             tickerPrice.data.append(Trade.init(
                                c: result.data[0].c,
                                p: result.data[0].p,
                                s: result.data[0].s,
                                t: result.data[0].t,
                                v: result.data[0].v)
                             )
    //                         print(tickerPrice)
                             self?._view.symbolDetailData = tickerPrice
                             self?._view.stockTable.reloadData()
                         }
                     } catch  {
                         print("error is \(error)")
                     }

                 @unknown default:
                     print("@unknown default:")
                 }
                
                 self?.receive()
             case .failure(let error):
                 print("Error received: \(error)")
             }
        })
    }

    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        print("in func didOpenWithProtocol")
        ping()
        receive()
        send()
    }

    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        print("in func didCloseWith")
    }
}

