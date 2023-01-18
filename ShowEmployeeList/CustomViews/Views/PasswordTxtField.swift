//
//  PasswordTxtField.swift
//  CarsApp
//
//  Created by eslam dweeb on 17/01/2023.
//

import UIKit

class PasswordTxtField: UITextField {

    @IBInspectable
    var placeHolderColor: UIColor = UIColor.lightGray {
       didSet {
           self.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ?  self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: placeHolderColor])
       }
   }
    lazy var showPassBtn:UIButton = {
       let btn = UIButton()
        btn.setTitle("", for: .normal)
        btn.setImage(UIImage(named: "eye-hidden"), for: .normal)
        btn.addTarget(self, action: #selector(handelShowBtnTapped), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    private var isShowPass = false {
        didSet {
            handelShowBtn()
        }
    }
    private var insets:UIEdgeInsets = .init(top: 0, left: 8, bottom: 0, right: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addShowBtnToTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addShowBtnToTextField()
        
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

//    private func setInsets(forBounds bounds: CGRect) -> CGRect {
//
//        var totalInsets = insets //property in you subClass
//
//        if let leftView = leftView  { totalInsets.left += leftView.frame.origin.x }
//        if let rightView = rightView { totalInsets.right += rightView.bounds.size.width }
//
//        return bounds.inset(by: totalInsets)
//    }
//
//    override func textRect(forBounds bounds: CGRect) -> CGRect {
//        return setInsets(forBounds: bounds)
//    }
//
//    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
//        return setInsets(forBounds: bounds)
//    }
//
//    override func editingRect(forBounds bounds: CGRect) -> CGRect {
//        return setInsets(forBounds: bounds)
//    }
//
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {

        var rect = super.rightViewRect(forBounds: bounds)
        rect.origin.x -= insets.right

        return rect
    }
//
//    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
//
//        var rect = super.leftViewRect(forBounds: bounds)
//        rect.origin.x += insets.left
//
//        return rect
//    }
    @objc func handelShowBtnTapped(){
        isShowPass.toggle()
    }
    private func handelShowBtn(){
        showPassBtn.setImage(isShowPass ? UIImage(named: "eye") : UIImage(named: "eye-hidden"), for: .normal)
        self.isSecureTextEntry = !isShowPass
    }
    
    private func addShowBtnToTextField(){
//        let view = UIView()
//        view.addSubview(showPassBtn)
        self.rightView = showPassBtn
        self.rightViewMode = .always
       
//        view.backgroundColor = .black
//        showPassBtn.centerYInSuperview()
//        showPassBtn.anchor(top: nil, leading: nil, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 0, right: 8),size: .init(width: 20, height: 20))
//
    }
}
