//
//  SymbolDetailView.swift
//  FinnHub
//
//  Created by Ali Siddiqui on 2/2/24.
//

import UIKit

class SymbolDetailView: UIView, UITableViewDelegate, UITableViewDataSource {
    var symbolDetailData = SymbolDetailViewModel(data: [Trade](), type: "")
        
        /*symbol: "",
                                                 lastPrice: 0.0,
                                                 timeStamp: 0.0,
                                                 volume: 0.0)
         */
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerImageView)
        addSubview(stockTable)
        layoutConstraints()
        stockTable.delegate = self
        stockTable.dataSource = self
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
    
    
    let stockTable: UITableView = {
        let stockTable = UITableView()
        stockTable.translatesAutoresizingMaskIntoConstraints = false
        stockTable.register(SymbolDetailTableViewCell.self, forCellReuseIdentifier: "SymbolDetailTableViewCell")
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
            
            stockTable.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 5),
            stockTable.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 50),
            stockTable.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -50),
            stockTable.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
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
    
}


