//
//  BaseTextField.swift
//  CarsApp
//
//  Created by eslam dweeb on 14/01/2023.
//

import UIKit

class BaseTextField:UITextField {
    @IBInspectable
    var placeHolderColor: UIColor = UIColor.lightGray {
       didSet {
           self.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ?  self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: placeHolderColor])
       }
   }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
           var textRect = super.textRect(forBounds: bounds)
        textRect.origin.x += 8
           return textRect
       }
       override func editingRect(forBounds bounds: CGRect) -> CGRect {
           var textRect = super.editingRect(forBounds: bounds)
           textRect.origin.x += 8
           return textRect
       }
}
