//
//  ListingCell.swift
//  Home Match
//
//  Created by Sterling Gamble on 9/18/21.
//

import UIKit

class ListingCell: UICollectionViewCell {
    static let identifier = "ListingCell"
    
    private var gradient: CAGradientLayer?
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let infoView = UIView()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "Avenir-Black", size: 12)
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.6)
        label.font = UIFont(name: "Avenir-Black", size: 10)
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .lightGray
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        infoView.frame = CGRect(x: 0, y: contentView.bounds.height/2, width: contentView.bounds.width, height: contentView.bounds.height/2)
        
        // gradient will only display when defined in layoutSubviews()
        // must check if a gradient is already set so we dont duplicated when layoutSubviews() is called multiple times while scrolling
        if let gradient = gradient {
            gradient.frame = infoView.bounds
        } else {
            gradient = CAGradientLayer()
            gradient?.frame = infoView.bounds
            gradient?.colors = [UIColor.clear.cgColor, UIColor(red: 0.15, green: 0.07, blue: 0.06, alpha: 1.00).cgColor]
            infoView.layer.insertSublayer(gradient!, at: 0)
        }

    }
    
    func layout() {
        contentView.addSubview(imageView)
        contentView.addSubview(infoView)
        contentView.addSubview(addressLabel)
        contentView.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            
            addressLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 116),
            addressLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: addressLabel.trailingAnchor, multiplier: 2),
            addressLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: 0),
            
            priceLabel.topAnchor.constraint(equalToSystemSpacingBelow: addressLabel.bottomAnchor, multiplier: 2),
            priceLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: priceLabel.trailingAnchor, multiplier: 2),
//            priceLabel.bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: -2)
        
            
        ])
    }
}
