//
//  MarketView.swift
//  FinnHub
//
//  Created by Ali Siddiqui on 2/1/24.
//

import UIKit

class MarketView: UIView, UIPickerViewDelegate, UIPickerViewDataSource  {
    let dataArray = [String]() //"US Market", "European Market", "Asian Market", "Chinese MArket"]

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
 //       pickerView.backgroundColor = .white
        return pickerView
    }()

    override init(frame: CGRect)
    {
        super.init(frame: frame)
        addSubview(pickerView)
        backgroundColor = .systemRed
 //       layoutConstraints()
        pickerView.delegate = self
        pickerView.dataSource = self
//        enterButton.addTarget(self, action: #selector(symbolHander), for: .touchUpInside)
    }

    func layoutConstraints() {
        NSLayoutConstraint.activate([
            pickerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            pickerView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 0),
            pickerView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: 0),
            pickerView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.25),
        ])
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return dataArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       let row = dataArray[row]
       return row
    }

}
