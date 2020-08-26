//
//  CircleButton.swift
//  UI_FinanceMobileApp
//
//  Created by Hunter Gilliam on 8/26/20.
//

import UIKit

class CircleButton: UIButton {
    
    var color1: UIColor!
    var color2: UIColor!
    var image: UIImage!
    
    init(image: UIImage, color1: UIColor, color2: UIColor) {
        self.color1 = color1
        self.color2 = color2
        self.image = image
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        setupView()
    }
    
    private func setupView() {
        setupBackground()
        setupIcon()
    }
    
    private func setupBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = .axial
        gradientLayer.startPoint = CGPoint(x: -1, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.frame = bounds
        gradientLayer.colors = [color1, color2].map { $0.cgColor }
        gradientLayer.cornerRadius = frame.height/2
        
        layer.addSublayer(gradientLayer)
    }
    
    private func setupIcon() {
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        imageView?.image = image
        imageView?.contentMode = .scaleAspectFit
        imageView?.tintColor = .white
        
        guard let imageView = imageView else { return }
        
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2.5),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2.5)
        ])
    }
}
