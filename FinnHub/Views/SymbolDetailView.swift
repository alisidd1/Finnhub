//
//  SymbolDetailView.swift
//  FinnHub
//
//  Created by Ali Siddiqui on 2/2/24.
//

import UIKit

class SymbolDetailView: UIView, UITableViewDelegate, UITableViewDataSource {
    var symbolDetailData = SymbolDetailViewModel(data: [Trade](), type: "")
                
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerImageView)
        addSubview(stockSymbolTextFiled)
        addSubview(stockTable)
        addSubview(enterButton)
        layoutConstraints()
        stockTable.delegate = self
        stockTable.dataSource = self
        enterButton.addTarget(self, action: #selector(symbolHandler), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     let headerImageView: UIImageView = {
        let headerImageView = UIImageView()
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        headerImageView.backgroundColor = .systemPink
        headerImageView.image = UIImage(named: "detailImage")
        return headerImageView
    }()
    
    let stockSymbolTextFiled: UITextField = {
        let stockSymbolTextFiled = UITextField()
        stockSymbolTextFiled.translatesAutoresizingMaskIntoConstraints = false
        stockSymbolTextFiled.backgroundColor = .systemCyan
        stockSymbolTextFiled.textColor = .black
        stockSymbolTextFiled.attributedPlaceholder = NSAttributedString(
            string: "Enter one or more comma separated symbols",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        return stockSymbolTextFiled
    }()

    let stockTable: UITableView = {
        let stockTable = UITableView()
        stockTable.translatesAutoresizingMaskIntoConstraints = false
        stockTable.register(SymbolDetailTableViewCell.self, forCellReuseIdentifier: "SymbolDetailTableViewCell")
        return stockTable
    }()
    
    let enterButton: UIButton = {
        let enterButton = UIButton()
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        enterButton.setTitle("Stop", for: .normal)
        enterButton.titleLabel?.textAlignment = .center
        enterButton.setTitleColor(.black, for: .normal)
        enterButton.layer.cornerRadius = 3
        enterButton.layer.borderWidth = 2
        enterButton.layer.borderColor = UIColor.black.cgColor
        enterButton.backgroundColor = .systemGray
        return enterButton
    }()

    
    override func layoutSubviews() {
        layoutConstraints()
    }
    
    func layoutConstraints(){
        NSLayoutConstraint.activate([
            headerImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            headerImageView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 0),
            headerImageView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: 0),
            headerImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.25),
            
            stockSymbolTextFiled.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 5),
            stockSymbolTextFiled.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 10),
            stockSymbolTextFiled.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -10),
            stockSymbolTextFiled.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.05),

            stockTable.topAnchor.constraint(equalTo: stockSymbolTextFiled.bottomAnchor, constant: 5),
            stockTable.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 50),
            stockTable.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -50),
            stockTable.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.2),

            enterButton.topAnchor.constraint(equalTo: stockTable.bottomAnchor, constant: 10),
            enterButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 50),
            enterButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.2),
            enterButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.05),
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SymbolDetailTableViewCell", for: indexPath) as? SymbolDetailTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(symbolData: symbolDetailData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func viewWillAppear(_ animated: Bool) {
        stockTable.reloadData()
    }
    
    
    @objc func symbolHandler() {
//        if stockSymbolLabel.text?.isEmpty == true && 
//            symbolData.close != 0.0 &&
//                        stockSymbolLabel.text?.isAlpha != nil {
//            symbolData.close = 0.0
//            stockSymbolLabel.text = ""
//            stockSymbolTextFiled.text = ""
//            stockTable.reloadData()
//            return
//        }
 
//        stockSymbolLabel.text = stockSymbolTextFiled.text?.uppercased()
//        NetworkManager.shared.getStockQuote(symbol: stockSymbolTextFiled.text!) { [weak self] result in
//            switch result {
//            case .failure(let error):
//                print("Error: \(error)")
//                DispatchQueue.main.async {
//                    self?.delegate?.NetworkCallReturnedInvalidresponse()
//                    self?.stockSymbolLabel.text = ""
//                    self?.stockSymbolTextFiled.text = ""
//                    self?.symbolData.close = 0.0
//                    self?.stockTable.reloadData()
//                    return
//                }
//            case .success(let data):
//                self?.symbolData = data
//                DispatchQueue.main.async {
//                    self?.stockTable.reloadData()
//                }
//            }
//        }
    }
}


