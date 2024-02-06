//
//  SymbolView.swift
//  FinnHub
//
//  Created by Ali Siddiqui on 1/30/24.
//

import UIKit

protocol  SymbolViewDelegate: AnyObject {
    func NetworkCallReturnedInvalidresponse()
}

class SymbolView: UIView, UITableViewDelegate, UITableViewDataSource {
    weak var delegate: SymbolViewDelegate?
    
    var symbolData = StockAPIResponse(close: 0.0,
                                      dailyGain: 0.0,
                                      dailyPercent: 0.0,
                                      high: 0.0,
                                      low: 0.0,
                                      open: 0.0,
                                      pervClose: 0.0,
                                      totalVolume: 0.0)
    
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        addSubview(headerImageView)
        addSubview(stockSymbolTextFiled)
        addSubview(enterButton)
        addSubview(stockSymbolLabel)
        addSubview(stockTable)
        layoutConstraints()
        stockTable.delegate = self
        stockTable.dataSource = self
        enterButton.addTarget(self, action: #selector(symbolHander), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     let headerImageView: UIImageView = {
        let headerImageView = UIImageView()
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        headerImageView.backgroundColor = .systemPink
        headerImageView.image = UIImage(named: "image")
        return headerImageView
    }()
    
    
    let stockSymbolTextFiled: UITextField = {
        let stockSymbolTextFiled = UITextField()
        stockSymbolTextFiled.translatesAutoresizingMaskIntoConstraints = false
        stockSymbolTextFiled.backgroundColor = .systemCyan
        stockSymbolTextFiled.textColor = .black
        stockSymbolTextFiled.attributedPlaceholder = NSAttributedString(
            string: "Enter Symbol",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        return stockSymbolTextFiled
    }()
    
    let enterButton: UIButton = {
        let enterButton = UIButton()
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        enterButton.setTitle("GO", for: .normal)
        enterButton.titleLabel?.textAlignment = .center
        enterButton.setTitleColor(.black, for: .normal)
        enterButton.layer.cornerRadius = 3
        enterButton.layer.borderWidth = 2
        enterButton.layer.borderColor = UIColor.black.cgColor
        enterButton.backgroundColor = .systemGray
        return enterButton
    }()
    
    var stockSymbolLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemCyan
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()

    let stockTable: UITableView = {
        let stockTable = UITableView()
        stockTable.translatesAutoresizingMaskIntoConstraints = false
        stockTable.register(SymbolViewCell.self, forCellReuseIdentifier: "SymbolViewCell")
        return stockTable
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
            
            stockSymbolTextFiled.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 50),
            stockSymbolTextFiled.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 50),
            stockSymbolTextFiled.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -200),
            stockSymbolTextFiled.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.05),
            
            enterButton.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 50),
            enterButton.leftAnchor.constraint(equalTo: stockSymbolTextFiled.rightAnchor, constant: 10),
            enterButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -150),
            enterButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.05),

            stockSymbolLabel.topAnchor.constraint(equalTo: stockSymbolTextFiled.bottomAnchor, constant: 50),
            stockSymbolLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 50),
            stockSymbolLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -250),
            stockSymbolLabel.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.05),


            stockTable.topAnchor.constraint(equalTo: stockSymbolLabel.bottomAnchor, constant: 50),
            stockTable.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 50),
            stockTable.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -50),
            stockTable.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if symbolData.close.isEqual(to: 0) {
            return 0
        } else { return 1 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SymbolViewCell", for: indexPath) as? SymbolViewCell else {
            return UITableViewCell()
        }
        cell.configure(symbolData: symbolData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @objc func symbolHander() {
        if stockSymbolLabel.text?.isEmpty == true && symbolData.close != 0.0 &&
                        stockSymbolLabel.text?.isAlphanumeric != nil{
            symbolData.close = 0.0
            stockTable.reloadData()
            return
        }
        stockSymbolLabel.text = stockSymbolTextFiled.text?.uppercased()
        NetworkManager.shared.getStockQuote(symbol: stockSymbolTextFiled.text!) { [weak self] result in
            switch result {
            case .failure(let error):
                print("Error: \(error)")
                DispatchQueue.main.async {
                    self?.delegate?.NetworkCallReturnedInvalidresponse()
                    return
                }
            case .success(let data):
                self?.symbolData = data
                DispatchQueue.main.async {
                    self?.stockTable.reloadData()
                }
            }
            
        }
    }
    
    func viewWillAppear(_ animated: Bool) {
        if symbolData.close == 0 {
            self.stockTable.isHidden = true
            stockTable.reloadData()
        }
        else {
            self.stockTable.isHidden = false
            stockTable.reloadData()
        }
    }
    
    func deleteBackward() {
    //    super.deleteBackward()
        print("Backspace");
        self.endEditing(true);
    }
}

extension String {
    var isAlphanumeric: Bool {
        allSatisfy { ($0.isLetter) && $0.isASCII }
    }
}
