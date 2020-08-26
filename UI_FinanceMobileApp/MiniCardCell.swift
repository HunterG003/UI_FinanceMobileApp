//
//  MiniCardCell.swift
//  UI_FinanceMobileApp
//
//  Created by Hunter Gilliam on 8/26/20.
//

import UIKit

class MiniCardCell: UICollectionViewCell {
    
    var color1 : UIColor = .white
    var color2 : UIColor = .white
    let cardNameLabel = UILabel()
    let cardDigitsLabel = UILabel()
    
    override func layoutSubviews() {
        setupBackground()
        setupInfo()
    }
    
    private func setupBackground() {
        let outerRectFrame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        let outerPath = UIBezierPath(roundedRect: outerRectFrame, cornerRadius: frame.height / 7)
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = .axial
        gradientLayer.startPoint = CGPoint(x: -1, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.frame = bounds
        gradientLayer.colors = [color1, color2].map { $0.cgColor }
        
        let mask = CAShapeLayer()
        mask.path = outerPath.cgPath
        gradientLayer.mask = mask
        
        let innerRectFrame = CGRect(origin: .zero, size: CGSize(width: frame.width - 10, height: frame.height - 10))
        let innerPath = UIBezierPath(roundedRect: innerRectFrame, cornerRadius: (frame.height - 10) / 7)
        let innerShapeLayer = CAShapeLayer()
        innerShapeLayer.path = innerPath.cgPath
        innerShapeLayer.fillColor = UIColor.secondarySystemGroupedBackground.cgColor
        innerShapeLayer.fillRule = .evenOdd
        innerShapeLayer.position = CGPoint(x: 5, y: 5)
        
        
        layer.addSublayer(gradientLayer)
        layer.addSublayer(innerShapeLayer)

    }
    
    private func setupInfo() {
        let padding = frame.width * (1/6)
        
        cardNameLabel.text = "VISA"
        cardNameLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        cardNameLabel.textColor = .white
        cardNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        cardDigitsLabel.text = "**** 5213"
        cardDigitsLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        cardDigitsLabel.textColor = .white
        cardDigitsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(cardNameLabel)
        addSubview(cardDigitsLabel)
        
        NSLayoutConstraint.activate([
            cardNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            cardNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            
            cardDigitsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            cardDigitsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding)
        ])
    }
}
