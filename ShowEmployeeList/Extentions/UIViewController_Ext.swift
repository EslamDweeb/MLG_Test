//
//  UIViewController_Ext.swift
//  ShowEmployeeList
//
//  Created by eslam dweeb on 18/01/2023.
//

import UIKit

extension UIViewController {
    func createAlert(title: String? = nil,erroMessage: String,createButton:Bool? = true,completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title ?? "", message: erroMessage, preferredStyle: UIAlertController.Style.alert)
//        alert.setBackgroundColor(color: .darkGray)
//        alert.setMessage(font: nil, color: .white)
        if createButton == true{
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { action in
                if let completion = completion {
                    completion()
                }else{
                    alert.dismiss(animated: true)
                }
            }
        alert.addAction(okButton)
        }
        self.present(alert, animated: true, completion: nil)
    }
    class func loadController() -> Self {
            let controller = Self(nibName: String(describing: self), bundle: nil)
             return controller
        }
}
