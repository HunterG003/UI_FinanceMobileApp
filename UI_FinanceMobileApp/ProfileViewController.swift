//
//  ViewController.swift
//  UI_FinanceMobileApp
//
//  Created by Hunter Gilliam on 8/25/20.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let incomeLabel = UILabel()
    private let incomeAmountLabel = UILabel()
    private let outcomeLabel = UILabel()
    private let outcomeAmountLabel = UILabel()
    private var cardView : CardView!
    private let activityLabel = UILabel()
    private let activityMoreButton = UIImageView()
    private var collectionView : UICollectionView!
    private let sendMoneyButton = CircleButton(image: UIImage(systemName: "plus")!, color1: .orange, color2: .purple)
    
    let payments : [Payment] = [
        Payment(paymentType: .outgoing, paymentName: "Hosting Payment", paymentDate: "11 February 4:12 PM", paymentAmount: "- $ 320.99", amountRemaining: "$ 3941.23"),
        Payment(paymentType: .incoming, paymentName: "Envato Elements", paymentDate: "11 February 4:12 PM", paymentAmount: "+ $ 900", amountRemaining: "$ 3941.23"),
        Payment(paymentType: .incoming, paymentName: "Freelance", paymentDate: "11 February 4:12 PM", paymentAmount: "+ $ 236.12", amountRemaining: "$ 3941.23"),
        Payment(paymentType: .outgoing, paymentName: "Gym Membership", paymentDate: "11 February 4:12 PM", paymentAmount: "- $ 45.00", amountRemaining: "$ 3941.23")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        setupNavigationBar()
        setupMoneyInfo()
        setupCardView()
        setupActivityInfo()
        setupCollectionView()
        setupSendMoneyButton()
    }
    
    private func setupNavigationBar() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: nil)
        let moreButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: nil)
        
        backButton.tintColor = .orange
        moreButton.tintColor = .purple
        
        title = "Profile"
        
        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItem = moreButton
    }
    
    private func setupMoneyInfo() {
        let centerOffset = (view.bounds.width / 2) / 2
        let fontSize : CGFloat = 15
        
        incomeLabel.text = "Income"
        incomeLabel.translatesAutoresizingMaskIntoConstraints = false
        incomeLabel.textColor = .label
        incomeLabel.font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        incomeLabel.textAlignment = .center
        
        incomeAmountLabel.text = "$ 7823.21"
        incomeAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        incomeAmountLabel.textColor = .label
        incomeAmountLabel.font = UIFont.systemFont(ofSize: 25, weight: .thin)
        incomeAmountLabel.textAlignment = .center
        
        outcomeLabel.text = "Outcome"
        outcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        outcomeLabel.textColor = .label
        outcomeLabel.font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        outcomeLabel.textAlignment = .center
        
        outcomeAmountLabel.text = "$ 953.84"
        outcomeAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        outcomeAmountLabel.textColor = .label
        outcomeAmountLabel.font = UIFont.systemFont(ofSize: 25, weight: .thin)
        outcomeAmountLabel.textAlignment = .center
        
        view.addSubview(incomeLabel)
        view.addSubview(incomeAmountLabel)
        view.addSubview(outcomeLabel)
        view.addSubview(outcomeAmountLabel)
        
        NSLayoutConstraint.activate([
            incomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            incomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -centerOffset),
            
            incomeAmountLabel.topAnchor.constraint(equalTo: incomeLabel.bottomAnchor, constant: 5),
            incomeAmountLabel.centerXAnchor.constraint(equalTo: incomeLabel.centerXAnchor),
            
            outcomeLabel.topAnchor.constraint(equalTo: incomeLabel.topAnchor),
            outcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: centerOffset),
            
            outcomeAmountLabel.topAnchor.constraint(equalTo: incomeAmountLabel.topAnchor),
            outcomeAmountLabel.centerXAnchor.constraint(equalTo: outcomeLabel.centerXAnchor)
        ])
    }
    
    private func setupCardView() {
        let horizontalOffset : CGFloat = 20
        cardView = CardView(name: "Antonia Berger", last4Digits: "5213", color1: .orange, color2: .purple)
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(cardView)
        
        NSLayoutConstraint.activate([
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalOffset),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalOffset),
            cardView.topAnchor.constraint(equalTo: incomeAmountLabel.bottomAnchor, constant: 35),
            cardView.heightAnchor.constraint(equalToConstant: view.bounds.height / 4)
        ])
    }
    
    private func setupActivityInfo() {
        activityLabel.text = "Activity"
        activityLabel.translatesAutoresizingMaskIntoConstraints = false
        activityLabel.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        activityLabel.textColor = .label
        
        activityMoreButton.image = UIImage(systemName: "ellipsis")
        activityMoreButton.tintColor = .gray
        activityMoreButton.contentMode = .scaleAspectFit
        activityMoreButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(activityLabel)
        view.addSubview(activityMoreButton)
        
        NSLayoutConstraint.activate([
            activityLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 5),
            activityLabel.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 25),
            
            activityMoreButton.centerYAnchor.constraint(equalTo: activityLabel.centerYAnchor),
            activityMoreButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -5),
            activityMoreButton.widthAnchor.constraint(equalToConstant: 25),
            activityMoreButton.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ActivityCell.self, forCellWithReuseIdentifier: "ActivityCell")
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: activityLabel.bottomAnchor, constant: 25),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupSendMoneyButton() {
        sendMoneyButton.addTarget(self, action: #selector(sendMoneyPressed), for: .touchUpInside)
        sendMoneyButton.translatesAutoresizingMaskIntoConstraints = false
        let width = view.bounds.width * (1/6)
        
        view.addSubview(sendMoneyButton)
        
        NSLayoutConstraint.activate([
            sendMoneyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendMoneyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            sendMoneyButton.widthAnchor.constraint(equalToConstant: width),
            sendMoneyButton.heightAnchor.constraint(equalToConstant: width)
        ])
    }
    
    @objc func sendMoneyPressed() {
        navigationController?.pushViewController(SendMoneyViewController(), animated: true)
    }


}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return payments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActivityCell", for: indexPath) as! ActivityCell
        
        cell.payment = payments[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 40
        return CGSize(width: width, height: 75)
    }
    
    
    
}

