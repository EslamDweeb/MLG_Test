//
//  BaseButton.swift
//  CarsApp
//
//  Created by eslam dweeb on 14/01/2023.
//

import UIKit

class BaseButton:UIButton {
    
    var btnTitle:String?{
        didSet {
            guard let btnTitle else{return}
            setTitle(btnTitle, for: .normal)
            self.titleLabel?.font = Fonts.fontMedium(size: FontSize.fontSmall)
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure(){
        self.layer.cornerRadius = 8
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = .black
    }
}

