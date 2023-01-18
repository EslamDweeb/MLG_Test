//
//  BlackBorderBtn.swift
//  CarsApp
//
//  Created by eslam dweeb on 14/01/2023.
//

import UIKit

class BlackBorderBtn:UIButton {
    
    var btnTitle:String?{
        didSet {
            guard let btnTitle else{return}
            setTitle(btnTitle, for: .normal)
            self.contentHorizontalAlignment = .left
            self.titleLabel?.font = Fonts.fontMedium(size: FontSize.fontSmall)
        }
    }
    var trailingImage:UIImage?{
        didSet {
            guard let trailingImage else{return}
            createTrailingImage(image: trailingImage)
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
        self.setTitleColor(.black, for: .normal)
        self.borderColor = .black
        self.borderWidth = 1
        self.backgroundColor = .white
    }
    private func createTrailingImage(image:UIImage){
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            imageView.heightAnchor.constraint(equalToConstant: 8),
            imageView.widthAnchor.constraint(equalToConstant: 8),
        ])
    }
}
