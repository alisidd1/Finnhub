//
//  SymbolViewCell.swift
//  FinnHub
//
//  Created by Ali Siddiqui on 1/30/24.
//

import UIKit

class SymbolViewCell: UITableViewCell {
    let identfier = "SymbolViewCell"
    
    var closeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemBlue
        label.numberOfLines = 0
        return label
    }()
    
    var dailyGainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemBlue
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    var dailyPercentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemBlue
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    var highLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemBlue
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    var lowLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemBlue
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    var openLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemBlue
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    var prevCloseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemBlue
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    var totalVolumeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemBlue
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(closeLabel)
        contentView.addSubview(dailyGainLabel)
        contentView.addSubview(dailyPercentLabel)
        contentView.addSubview(highLabel)
        contentView.addSubview(lowLabel)
        contentView.addSubview(openLabel)
        contentView.addSubview(prevCloseLabel)
        contentView.addSubview(totalVolumeLabel)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            closeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            closeLabel.heightAnchor.constraint(equalToConstant: 30),
            closeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            closeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            dailyGainLabel.topAnchor.constraint(equalTo: closeLabel.bottomAnchor, constant: 0),
            dailyGainLabel.heightAnchor.constraint(equalToConstant: 30),
            dailyGainLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            dailyGainLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),

            dailyPercentLabel.topAnchor.constraint(equalTo: dailyGainLabel.bottomAnchor, constant: 0),
            dailyPercentLabel.heightAnchor.constraint(equalToConstant: 30),
            dailyPercentLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            dailyPercentLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            highLabel.topAnchor.constraint(equalTo: dailyPercentLabel.bottomAnchor, constant: 0),
            highLabel.heightAnchor.constraint(equalToConstant: 30),
            highLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            highLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            lowLabel.topAnchor.constraint(equalTo: highLabel.bottomAnchor, constant: 0),
            lowLabel.heightAnchor.constraint(equalToConstant: 30),
            lowLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            lowLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            openLabel.topAnchor.constraint(equalTo: lowLabel.bottomAnchor, constant: 0),
            openLabel.heightAnchor.constraint(equalToConstant: 30),
            openLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            openLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            prevCloseLabel.topAnchor.constraint(equalTo: openLabel.bottomAnchor, constant: 0),
            prevCloseLabel.heightAnchor.constraint(equalToConstant: 30),
            prevCloseLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            prevCloseLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            totalVolumeLabel.topAnchor.constraint(equalTo: prevCloseLabel.bottomAnchor, constant: 0),
            totalVolumeLabel.heightAnchor.constraint(equalToConstant: 30),
            totalVolumeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            totalVolumeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        closeLabel.text = nil
        dailyGainLabel .text = nil
    }
    
    func configure(symbolData: StockAPIResponse) {
        closeLabel.text      = ("Close:           \(String(symbolData.close))")
        dailyGainLabel.text  = ("Daily Gain:      \(String(symbolData.dailyGain))")
        dailyPercentLabel.text = ("Daily Percent:   \(String(symbolData.dailyPercent))")
        highLabel.text       = ("High:            \(String(symbolData.high))")
        lowLabel.text        = ("Low:             \(String(symbolData.low))")
        openLabel.text       = ("Open:            \(String(symbolData.open))")
        prevCloseLabel.text  = ("Prev. Close:     \(String(symbolData.pervClose))")
        totalVolumeLabel.text = ("Volume:         \(String(symbolData.totalVolume))")
          
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
