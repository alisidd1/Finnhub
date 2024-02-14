//
//  SymbolDetailTableViewCell.swift
//  FinnHub
//
//  Created by Ali Siddiqui on 2/13/24.
//

import UIKit

class SymbolDetailTableViewCell: UITableViewCell {
    let identfier = "SymbolDetailTableViewCell"
    
    var symbolLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemBlue
        label.numberOfLines = 0
        return label
    }()
    
    var lastPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemBlue
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    var unixTimestampLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemBlue
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    var volumeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemBlue
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(symbolLabel)
        contentView.addSubview(lastPriceLabel)
        contentView.addSubview(unixTimestampLabel)
        contentView.addSubview(volumeLabel)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            symbolLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            symbolLabel.heightAnchor.constraint(equalToConstant: 30),
            symbolLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            symbolLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            lastPriceLabel.topAnchor.constraint(equalTo: symbolLabel.bottomAnchor, constant: 0),
            lastPriceLabel.heightAnchor.constraint(equalToConstant: 30),
            lastPriceLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            lastPriceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),

            unixTimestampLabel.topAnchor.constraint(equalTo: lastPriceLabel.bottomAnchor, constant: 0),
            unixTimestampLabel.heightAnchor.constraint(equalToConstant: 30),
            unixTimestampLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            unixTimestampLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            volumeLabel.topAnchor.constraint(equalTo: unixTimestampLabel.bottomAnchor, constant: 0),
            volumeLabel.heightAnchor.constraint(equalToConstant: 30),
            volumeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            volumeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
         ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        lastPriceLabel.text = nil
        unixTimestampLabel.text = nil
        volumeLabel.text = nil 
    }
    
    func configure(symbolData: SymbolDetailViewModel) {
//        print("\n****** \(symbolData)")
        if symbolData.data.isEmpty {
            symbolLabel.text = "Symbol:  GOOG"
            lastPriceLabel.text      = "Last Price:  0.0"
            unixTimestampLabel.text  = "Timestamp:  0.0"
            volumeLabel.text = "Volume:  0.0"
        } else {
  //          print("\n****** \(symbolData.data[0])")
            
            symbolLabel.text         = "Symbol:  GOOG"
            lastPriceLabel.text      = "Last Price:  \(symbolData.data[0].p)"
            unixTimestampLabel.text  = "Timestamp:  \(symbolData.data[0].t)"
            volumeLabel.text         = "Volume:  \(symbolData.data[0].v)"

        }
        //        symbolLabel.text = "GOOG"
        //        lastPriceLabel.text      = ("LastPrice:           \(String(symbolData.lastPrice))")
        //        unixTimestampLabel.text  = ("Timestamp:      \(String(symbolData.timeStamp))")
        //        volumeLabel.text = ("Volume:   \(String(symbolData.volume))")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
