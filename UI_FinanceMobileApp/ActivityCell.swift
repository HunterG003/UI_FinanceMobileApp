//
//  ActivityCell.swift
//  UI_FinanceMobileApp
//
//  Created by Hunter Gilliam on 8/25/20.
//

import UIKit

enum PaymentType {
    case incoming
    case outgoing
}

struct Payment {
    let paymentType: PaymentType
    let paymentName: String
    let paymentDate: String
    let paymentAmount: String
    let amountRemaining: String
}

class ActivityCell: UICollectionViewCell {
    
    var payment: Payment!
    
    private var paymentLabel = UILabel()
    private var dateLabel = UILabel()
    private var amountLabel = UILabel()
    private var totalRemainingLabel = UILabel()
    private var color: UIColor!
    private var arrowImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    func setupView() {
        switch payment.paymentType {
        case .incoming:
            color = .orange
            arrowImage.image = UIImage(systemName: "arrow.up")
        case .outgoing:
            color = .purple
            arrowImage.image = UIImage(systemName: "arrow.down")
        }
        
        let roundedView = UIView()
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        roundedView.backgroundColor = .secondarySystemGroupedBackground
        roundedView.layer.cornerRadius = 20
        roundedView.layer.borderColor = color.cgColor
        roundedView.layer.borderWidth = 2
        
        arrowImage.contentMode = .scaleAspectFit
        arrowImage.tintColor = color
        arrowImage.translatesAutoresizingMaskIntoConstraints = false
        
        paymentLabel.translatesAutoresizingMaskIntoConstraints = false
        paymentLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        paymentLabel.textColor = .label
        paymentLabel.text = payment.paymentName
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.systemFont(ofSize: 10, weight: .light)
        dateLabel.textColor = .gray
        dateLabel.text = payment.paymentDate
        
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        amountLabel.textColor = color
        amountLabel.text = payment.paymentAmount
        
        totalRemainingLabel.translatesAutoresizingMaskIntoConstraints = false
        totalRemainingLabel.font = UIFont.systemFont(ofSize: 10, weight: .light)
        totalRemainingLabel.textColor = .gray
        totalRemainingLabel.text = payment.amountRemaining
        
        addSubview(roundedView)
        addSubview(arrowImage)
        addSubview(paymentLabel)
        addSubview(dateLabel)
        addSubview(amountLabel)
        addSubview(totalRemainingLabel)

        NSLayoutConstraint.activate([
            roundedView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            roundedView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            roundedView.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            roundedView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2),
            
            arrowImage.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 20),
            arrowImage.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor),
            arrowImage.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 1/3),
            arrowImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/3),
            
            paymentLabel.leadingAnchor.constraint(equalTo: arrowImage.trailingAnchor, constant: 10),
            paymentLabel.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -2),
            
            dateLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: paymentLabel.leadingAnchor),
            
            amountLabel.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: -20),
            amountLabel.centerYAnchor.constraint(equalTo: paymentLabel.centerYAnchor),
            
            totalRemainingLabel.trailingAnchor.constraint(equalTo: amountLabel.trailingAnchor),
            totalRemainingLabel.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor)
        ])
    }
    
}
