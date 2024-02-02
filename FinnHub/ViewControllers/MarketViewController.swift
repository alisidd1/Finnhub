//
//  MarketViewController.swift
//  FinnHub
//
//  Created by Ali Siddiqui on 2/1/24.
//

import UIKit

class MarketViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    let dataArray = ["US Market", "European Market", "Asian Market", "Chinese MArket"]

    private let _view = MarketView()

    override func loadView() {
        super.loadView()
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Market Data"

        let button = UIButton(frame: CGRect(x: 50, y: 70, width: 200, height: 50))
        view.addSubview(button)
        button.backgroundColor = .systemBlue
        button.setTitle("Click ME", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

//        let vc = UIWindow.getVisibleViewControllerFrom(vc: self)
        
//        let alert = UIAlertController(title: "Create Meditation", message: "", preferredStyle: .alert)
//        alert.addTextField { (textField) in
//            textField.text = "Enter Message"
//            print(textField)
//        }
//
//        let action = UIAlertAction(title: "Send", style: .default)
//        let action2 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        alert.addAction(action)
//        alert.addAction(action2)
//        present(alert, animated: true)

//        let customTabBarItem:UITabBarItem = UITabBarItem(title: "Market Data", image: nil, selectedImage: nil)
//        self.tabBarItem = customTabBarItem
        
        
        
//        let pickerView: UIPickerView = {
//            let pickerView = UIPickerView()
//            pickerView.translatesAutoresizingMaskIntoConstraints = false
//     //       pickerView.backgroundColor = .white
//            return pickerView
//        }()

        
        
//        let pickerView = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 250, height: 300))
     }
    
    @objc func buttonTapped() {
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: 250,height: 300)

        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 300))
        vc.view.addSubview(pickerView)
        pickerView.delegate = self
        pickerView.dataSource = self

        let itemAlert = UIAlertController(title: "Market Selection", message: "", preferredStyle: UIAlertController.Style.alert)
        itemAlert.setValue(vc, forKey: "contentViewController")
        itemAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        itemAlert.addAction(UIAlertAction(title: "Send", style: .default, handler: nil))
        
        itemAlert.addTextField { field in
            field.placeholder = "Enter your item"
            field.returnKeyType = .next
            field.keyboardType = .default
        }
        
//        guard let field = itemAlert.textFields, field.count == 1 else {
//            print("Error")
//            return
//        }
//        
//        let itemField = field[0]
//        guard let message = itemField.text, message != "" else {
//            print("empty text field")
//            return
//        }
//        print(itemField.text)
        
        self.present(itemAlert, animated: true)
        
        
        
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


public extension UIWindow {
    var visibleViewController: UIViewController? {
       return UIWindow.getVisibleViewControllerFrom(vc: self.rootViewController)
   }

    static func getVisibleViewControllerFrom(vc: UIViewController?) -> UIViewController? {
       if let nc = vc as? UINavigationController {
           return UIWindow.getVisibleViewControllerFrom(vc: nc.visibleViewController)
       } else if let tc = vc as? UITabBarController {
           return UIWindow.getVisibleViewControllerFrom(vc: tc.selectedViewController)
       } else {
           if let pvc = vc?.presentedViewController {
               return UIWindow.getVisibleViewControllerFrom(vc: pvc)
           } else {
               return vc
           }
       }
   }
}
