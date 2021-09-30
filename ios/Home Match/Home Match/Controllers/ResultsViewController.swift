//
//  ResultsViewController.swift
//  Home Match
//
//  Created by Sterling Gamble on 9/21/21.
//

import UIKit

class ResultsViewController: UIViewController {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.alwaysBounceVertical = true
//        cv.showsVerticalScrollIndicator = false
        cv.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        cv.register(ListingCell.self, forCellWithReuseIdentifier: "ListingCell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Black", size: 15)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        layout()
    }
    
    func layout() {
        view.addSubview(cancelButton)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            cancelButton.heightAnchor.constraint(equalToConstant: 20),
            cancelButton.widthAnchor.constraint(equalToConstant: 50),
            cancelButton.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 2),
            cancelButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            
            collectionView.topAnchor.constraint(equalToSystemSpacingBelow: cancelButton.bottomAnchor, multiplier: 2),
//            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: view.frame.height)
            
        ])
    }
    
    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }

}

extension ResultsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListingCell", for: indexPath) as! ListingCell
        UIImage.loadFrom(url: URL(string: "https://www.houseplans.net/news/wp-content/uploads/2020/07/Modern-963-00433-700x467.jpg")!) { image in
            cell.imageView.image = image
        }
        cell.addressLabel.text = "435 Washington Ave"
        cell.priceLabel.text = "$1,209,000"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 164, height: 164)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.present(ListingViewController(), animated: true, completion: nil)
    }
    
    
}
