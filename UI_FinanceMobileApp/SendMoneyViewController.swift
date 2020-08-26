//
//  SendMoneyViewController.swift
//  UI_FinanceMobileApp
//
//  Created by Hunter Gilliam on 8/26/20.
//

import UIKit

class SendMoneyViewController: UIViewController {
    
    private let headingLabel = UILabel()
    private let subheadingLabel = UILabel()
    private var collectionView: UICollectionView!
    private let footerView = UIView()
    private let amountLabel = UILabel()
    private let amountSlider = UISlider()
    private let tooltipLabel = UILabel()
    private var sendButton : CircleButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        setupNavigationBar()
        setupTitleLabels()
        setupCollectionView()
        setupFooterView()
    }
    
    private func setupNavigationBar() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(backButtonPressed))
        let moreButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: nil)
        
        backButton.tintColor = .orange
        moreButton.tintColor = .purple
        
        title = "Send Money"
        
        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItem = moreButton
    }
    
    private func setupTitleLabels() {
        headingLabel.translatesAutoresizingMaskIntoConstraints = false
        headingLabel.text = "Send money to Steven"
        headingLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        headingLabel.textColor = .white
        
        subheadingLabel.translatesAutoresizingMaskIntoConstraints = false
        subheadingLabel.text = "Send from Visa 5213"
        subheadingLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        subheadingLabel.textColor = .white
        
        view.addSubview(headingLabel)
        view.addSubview(subheadingLabel)
        
        NSLayoutConstraint.activate([
            headingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            headingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            subheadingLabel.leadingAnchor.constraint(equalTo: headingLabel.leadingAnchor),
            subheadingLabel.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 5)
        ])
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MiniCardCell.self, forCellWithReuseIdentifier: "MiniCardCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.contentInset.left = 25
        
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: subheadingLabel.bottomAnchor, constant: 50),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/6)
        ])
    }
    
    private func setupFooterView() {
        footerView.backgroundColor = .white
        footerView.translatesAutoresizingMaskIntoConstraints = false
        footerView.layer.cornerRadius = 40
        
        amountLabel.text = "$423"
        amountLabel.textColor = .black
        amountLabel.font = UIFont.systemFont(ofSize: 65, weight: .light)
        amountLabel.textAlignment = .center
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        amountSlider.translatesAutoresizingMaskIntoConstraints = false
        amountSlider.minimumValue = 1
        amountSlider.maximumValue = 1000
        amountSlider.setValue(423, animated: false)
        
        tooltipLabel.translatesAutoresizingMaskIntoConstraints = false
        tooltipLabel.text = "Use slider to select amount"
        tooltipLabel.textColor = .gray
        tooltipLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        tooltipLabel.textAlignment = .center
        
        sendButton = CircleButton(image: UIImage(systemName: "arrow.right")!, color1: .orange, color2: .purple)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        let width = view.bounds.width * (1/6)
        
        view.addSubview(footerView)
        view.addSubview(amountLabel)
        view.addSubview(amountSlider)
        view.addSubview(tooltipLabel)
        view.addSubview(sendButton)
        
        NSLayoutConstraint.activate([
            footerView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 50),
            footerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            amountLabel.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 60),
            amountLabel.centerXAnchor.constraint(equalTo: footerView.centerXAnchor),
            
            amountSlider.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 25),
            amountSlider.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -25),
            amountSlider.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 25),
            
            tooltipLabel.topAnchor.constraint(equalTo: amountSlider.bottomAnchor, constant: 25),
            tooltipLabel.centerXAnchor.constraint(equalTo: footerView.centerXAnchor),
            
            sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            sendButton.widthAnchor.constraint(equalToConstant: width),
            sendButton.heightAnchor.constraint(equalToConstant: width)
        ])
    }
    
    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func sendButtonPressed() {
        print("send")
    }

}

extension SendMoneyViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MiniCardCell", for: indexPath) as! MiniCardCell
        
        cell.color1 = .orange
        cell.color2 = .purple
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = view.bounds.height * (1/6)
        let width = view.bounds.width * (1/1.8)
        return CGSize(width: width, height: height)
    }
    
}
