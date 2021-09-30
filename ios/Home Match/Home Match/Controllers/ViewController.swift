//
//  ViewController.swift
//  Home Match
//
//  Created by Sterling Gamble on 9/14/21.
//

import UIKit

class ViewController: UIViewController {
    
    var searchImageURL: String?
//    var listings
    
    let searchStackView = UIStackView()
    
    let imageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addBackground(color: #colorLiteral(red: 0.9607843137, green: 0.968627451, blue: 0.9803921569, alpha: 1))
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let pinButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "mappin"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = #colorLiteral(red: 0.3960784314, green: 0.3960784314, blue: 0.3960784314, alpha: 1)
        return button
    }()
    
    let imageButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "photo.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = #colorLiteral(red: 0.3960784314, green: 0.3960784314, blue: 0.3960784314, alpha: 1)
        button.addTarget(self, action: #selector(imagePicker), for: .touchUpInside)
        return button
    }()
    
//    let searchField: UITextField = {
//        let field = UITextField()
//        field.placeholder = "Enter a location..."
//        field.translatesAutoresizingMaskIntoConstraints = false
//        field.textColor = #colorLiteral(red: 0.3960784314, green: 0.3960784314, blue: 0.3960784314, alpha: 1)
//        field.font = UIFont(name: "Avenir-Black", size: 15)
//        field.tintColor = .clear
//        return field
//    }()
    
    let searchField: UIButton = {
        let button = UIButton()
        button.setTitle("Enter a location...", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Black", size: 15)
        button.setTitleColor(#colorLiteral(red: 0.7411764706, green: 0.7490196078, blue: 0.7647058824, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(search), for: .touchUpInside)
        return button
    }()
    
    let searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
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


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        searchStackView.addBackground(color: #colorLiteral(red: 0.9607843137, green: 0.968627451, blue: 0.9803921569, alpha: 1))
        searchStackView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
//        searchField.delegate = self
        
        layout()
    }
    
    
    @objc func imagePicker() {
        let alert = UIAlertController(title: "Image Picker", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Image URL..."
        }

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { _ in
            if let url = alert.textFields?[0].text {
                UIImage.loadFrom(url: URL(string: url)!) { image in
                    self.searchImageView.image = image
                    self.imageButton.setBackgroundImage(nil, for: .normal)
                    self.searchImageURL = url
                }
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func search() {
        self.present(SearchViewController(), animated: true, completion: nil)
    }
    

// https://www.houseplans.net/news/wp-content/uploads/2020/07/Modern-963-00433-700x467.jpg
}

// MARK: Search Bar Functions
//extension ViewController: UITextFieldDelegate {
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        self.present(SearchViewController(), animated: true, completion: nil)
//    }
//
//}

// MARK: Collection View
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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

// MARK: Layout
extension ViewController {
    func layout() {
        searchStackView.addSubview(pinButton)
        searchStackView.addSubview(searchField)
        imageStackView.addSubview(searchImageView)
        imageStackView.addSubview(imageButton)
        
        view.addSubview(imageStackView)
        view.addSubview(searchStackView)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            searchStackView.heightAnchor.constraint(equalToConstant: 50),
            searchStackView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
//            searchStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
//            view.trailingAnchor.constraint(equalTo: searchStackView.trailingAnchor),
//            imageStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: searchStackView.trailingAnchor, multiplier: 1),
            imageStackView.leadingAnchor.constraint(equalTo: searchStackView.trailingAnchor, constant: 10),
            
            pinButton.topAnchor.constraint(equalTo: searchStackView.topAnchor, constant: 12),
            pinButton.leadingAnchor.constraint(equalToSystemSpacingAfter: searchStackView.leadingAnchor, multiplier: 1),
            pinButton.heightAnchor.constraint(equalToConstant: 26),
            pinButton.widthAnchor.constraint(equalToConstant: 26),
            
            
            searchField.heightAnchor.constraint(equalToConstant: 20),
            searchField.leadingAnchor.constraint(equalTo: pinButton.trailingAnchor, constant: -95),
            searchField.topAnchor.constraint(equalTo: searchStackView.topAnchor, constant: 15),
            searchStackView.trailingAnchor.constraint(equalTo: searchField.trailingAnchor, constant: 15),
            
            imageStackView.heightAnchor.constraint(equalToConstant: 50),
            imageStackView.widthAnchor.constraint(equalToConstant: 50),
            imageStackView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: imageStackView.trailingAnchor, multiplier: 2),
            
            searchImageView.topAnchor.constraint(equalTo: imageStackView.topAnchor),
            searchImageView.bottomAnchor.constraint(equalTo: imageStackView.bottomAnchor),
            searchImageView.leadingAnchor.constraint(equalTo: imageStackView.leadingAnchor),
            imageStackView.trailingAnchor.constraint(equalTo: searchImageView.trailingAnchor),
            
            imageButton.heightAnchor.constraint(equalToConstant: 20),
            imageButton.widthAnchor.constraint(equalToConstant: 20),
            imageButton.topAnchor.constraint(equalTo: imageStackView.topAnchor, constant: 15),
            imageButton.leadingAnchor.constraint(equalTo: imageStackView.leadingAnchor, constant: 15),
            
            collectionView.topAnchor.constraint(equalToSystemSpacingBelow: searchStackView.bottomAnchor, multiplier: 3),
//            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: view.frame.height)
        ])
    }
}

extension UIStackView {
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        subView.layer.cornerRadius = 16
        insertSubview(subView, at: 0)
    }
}

extension UIImage {
    public static func loadFrom(url: URL, completion: @escaping (_ image: UIImage?) -> ()) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }

}
