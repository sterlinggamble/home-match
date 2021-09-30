//
//  ListingViewController.swift
//  Home Match
//
//  Created by Sterling Gamble on 9/19/21.
//

import UIKit

class ListingViewController: UIViewController {
    
    let photosCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 6)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.alwaysBounceHorizontal = true
        cv.isPagingEnabled = true
//        cv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "photoCell")
        
        return cv
    }()
    
//    let photosView: UIView = {
//        let view = UIView()
//        view.backgroundColor = #colorLiteral(red: 0.8117647059, green: 0.8117647059, blue: 0.8117647059, alpha: 1)
//        view.layoutIfNeeded()
//        view.layer.masksToBounds = true
//        view.layer.cornerRadius = view.bounds.width / 2
//        return view
//    }()
    
    let infoStackView = UIStackView()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        button.addTarget(self, action: #selector(back), for: .touchUpInside)
        return button
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(search), for: .touchUpInside)
        return button
    }()
    
    let buttonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.9)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 20
        view.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.16)
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowRadius = 5
        return view
    }()
    
    let buttonView2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.9)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 20
        view.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.16)
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowRadius = 5
        return view
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Heavy", size: 25)
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Heavy", size: 15)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.45)
        return label
    }()
    
    let infoTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Black", size: 15)
        label.text = "House Information"
        return label
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Heavy", size: 15)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.45)
        return label
    }()
    
    let descTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Black", size: 15)
        label.text = "Description"
        return label
    }()
    
    let descLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Medium", size: 15)
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.45)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        photosCV.delegate = self
        photosCV.dataSource = self
        
        priceLabel.text = "$2,880,000"
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addressLabel.text = "1311 Clinton Ave, Alameda, CA 94501"
        infoLabel.text = "5 BD | 4 BR | 1832 sqft"
        descLabel.text = "An emerald oasis of your own awaits in the Gold Coast of Alameda. Nestled under four stately California Live Oak trees – the very native oak species that once populated the entire city – this wonderful 5 bedroom, 2.5 bath home embodies the suburban American dream home on a wider-than-usual lot for the Island City (5th bedroom/ former maids quarters)."
        
        layout()
    }
    
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func search() {
        present(ResultsViewController(), animated: true, completion: nil)
    }

}

extension ListingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath)
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.frame = cell.bounds
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        
        UIImage.loadFrom(url: URL(string: "https://www.houseplans.net/news/wp-content/uploads/2020/07/Modern-963-00433-700x467.jpg")!) { image in
            imageView.image = image
        }
        
        cell.addSubview(imageView)
        
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 16
        cell.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        cell.backgroundColor = .lightGray
        print("cell created")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 297)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


extension ListingViewController {
    func layout() {
        view.addSubview(photosCV)
        
        buttonView.addSubview(backButton)
        buttonView2.addSubview(searchButton)
        view.addSubview(buttonView)
        view.addSubview(buttonView2)
        
        infoStackView.addSubview(priceLabel)
        infoStackView.addSubview(addressLabel)
        infoStackView.addSubview(infoTitleLabel)
        infoStackView.addSubview(infoLabel)
        infoStackView.addSubview(descTitleLabel)
        infoStackView.addSubview(descLabel)
        view.addSubview(infoStackView)
        
        NSLayoutConstraint.activate([
            photosCV.topAnchor.constraint(equalTo: view.topAnchor),
            photosCV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: photosCV.trailingAnchor),
//            photosCV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            photosCV.heightAnchor.constraint(equalToConstant: 297),
            
            buttonView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
//            view.trailingAnchor.constraint(equalToSystemSpacingAfter: buttonView.trailingAnchor, multiplier: 2),
            buttonView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 2),
            buttonView.widthAnchor.constraint(equalToConstant: 36),
            buttonView.heightAnchor.constraint(equalToConstant: 36),
            
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: buttonView2.trailingAnchor, multiplier: 2),
            buttonView2.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 2),
            buttonView2.widthAnchor.constraint(equalToConstant: 36),
            buttonView2.heightAnchor.constraint(equalToConstant: 36),
            
            backButton.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            backButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
            searchButton.centerXAnchor.constraint(equalTo: buttonView2.centerXAnchor),
            searchButton.centerYAnchor.constraint(equalTo: buttonView2.centerYAnchor),
            
            infoStackView.topAnchor.constraint(equalTo: photosCV.bottomAnchor, constant: 37),
            infoStackView.leadingAnchor.constraint(equalTo: photosCV.leadingAnchor, constant: 34),
            view.trailingAnchor.constraint(equalTo: infoStackView.trailingAnchor, constant: 34),
            
            priceLabel.topAnchor.constraint(equalTo: infoStackView.topAnchor),
            addressLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 4),
            
            infoTitleLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 19),
            infoLabel.topAnchor.constraint(equalTo: infoTitleLabel.bottomAnchor, constant: 4),
            
            descTitleLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 19),
            descLabel.topAnchor.constraint(equalTo: descTitleLabel.bottomAnchor, constant: 4),
            descLabel.leadingAnchor.constraint(equalTo: infoStackView.leadingAnchor),
            infoStackView.trailingAnchor.constraint(equalTo: descLabel.trailingAnchor)
            
            
        ])
    }
}
