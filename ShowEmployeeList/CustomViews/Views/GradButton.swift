//
//  GradButton.swift
//  CarsApp
//
//  Created by eslam dweeb on 16/01/2023.
//

import UIKit

class GradiantButton:UIButton{
    
    var textColor:UIColor?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       // setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    private func setup(){
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
        self.setGradientBackground(firstColor: UIColor(named: "gradient2")!, secondColor: UIColor(named: "gradient1")!, thirdColor: nil, startPoint: CGPoint(x: 0.25, y: 0.5), endPoint: CGPoint(x: 0.75, y: 0.5), location: [0,1])
        if textColor != nil {
            setTitleColor(textColor, for: .normal)
        }
    }
}
