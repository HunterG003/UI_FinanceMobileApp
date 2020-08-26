//
//  CardView.swift
//  UI_FinanceMobileApp
//
//  Created by Hunter Gilliam on 8/25/20.
//

import UIKit

class CardView: UIView {
    
    var name: String
    var digits: String
    var color1: UIColor
    var color2: UIColor
    var width: CGFloat!
    var height: CGFloat!
    
    init(name: String, last4Digits digits: String, color1: UIColor, color2: UIColor) {
        self.name = name
        self.digits = digits
        self.color1 = color1
        self.color2 = color2
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.width = self.frame.width
        self.height = self.frame.height
        setupView()
    }
    
    func setupView() {
        let outerRectFrame = CGRect(x: 0, y: 0, width: width, height: height)
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
        
        let innerRectFrame = CGRect(origin: .zero, size: CGSize(width: width - 10, height: height - 10))
        let innerPath = UIBezierPath(roundedRect: innerRectFrame, cornerRadius: (frame.height - 10) / 7)
        let innerShapeLayer = CAShapeLayer()
        innerShapeLayer.path = innerPath.cgPath
        innerShapeLayer.fillColor = UIColor.secondarySystemGroupedBackground.cgColor
        innerShapeLayer.fillRule = .evenOdd
        innerShapeLayer.position = CGPoint(x: 5, y: 5)
        
        
        layer.addSublayer(gradientLayer)
        layer.addSublayer(innerShapeLayer)
        
        setupContent()
    }
    
    func setupContent() {
        let cardLabel: UILabel = {
            let lbl = UILabel()
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.text = "VISA"
            lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            lbl.textColor = .label
            return lbl
        }()
        
        let nameLabel: UILabel = {
            let lbl = UILabel()
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.text = self.name
            lbl.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            lbl.textColor = .label
            return lbl
        }()
        
        let subheadingLabel: UILabel = {
            let lbl = UILabel()
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.text = "Card Holder"
            lbl.font = UIFont.systemFont(ofSize: 10, weight: .medium)
            lbl.textColor = .label
            return lbl
        }()
        
        let cardNumberLabel: UILabel = {
            let lbl = UILabel()
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.text = "**** **** **** \(self.digits)"
            lbl.font = UIFont.systemFont(ofSize: 25, weight: .bold)
            lbl.textColor = .label
            return lbl
        }()
        
        addSubview(cardLabel)
        addSubview(nameLabel)
        addSubview(subheadingLabel)
        addSubview(cardNumberLabel)
        
        NSLayoutConstraint.activate([
            cardLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            cardLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            
            nameLabel.leadingAnchor.constraint(equalTo: cardLabel.leadingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -1),
            
            subheadingLabel.leadingAnchor.constraint(equalTo: cardLabel.leadingAnchor),
            subheadingLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: 1),
            
            cardNumberLabel.leadingAnchor.constraint(equalTo: cardLabel.leadingAnchor),
            cardNumberLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25)
        ])
    }
    
}
