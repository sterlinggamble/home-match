//
//  SearchViewController.swift
//  Home Match
//
//  Created by Sterling Gamble on 9/16/21.
//

import UIKit

class SearchViewController: UIViewController {
    
    let cities = ["Alameda, CA", "Oakland, CA", "Los Angeles, CA", "San Diego, CA"]
    
    let searchStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addBackground(color: #colorLiteral(red: 0.9607843137, green: 0.968627451, blue: 0.9803921569, alpha: 1))
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let searchField: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter a location..."
        field.translatesAutoresizingMaskIntoConstraints = false
        field.textColor = #colorLiteral(red: 0.3960784314, green: 0.3960784314, blue: 0.3960784314, alpha: 1)
        field.font = UIFont(name: "Avenir-Black", size: 15)
        return field
    }()
    
    let pinButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "mappin"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = #colorLiteral(red: 0.3960784314, green: 0.3960784314, blue: 0.3960784314, alpha: 1)
        return button
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Black", size: 15)
        button.setTitleColor(#colorLiteral(red: 0.3960784314, green: 0.3960784314, blue: 0.3960784314, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        return button
    }()
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        searchField.becomeFirstResponder()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "resultCell")
        
        layout()
    }
    
    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }
    

    func layout() {
        searchStackView.addSubview(pinButton)
        searchStackView.addSubview(searchField)
        
        view.addSubview(cancelButton)
        view.addSubview(searchStackView)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            searchStackView.heightAnchor.constraint(equalToConstant: 50),
            searchStackView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            searchStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3),
            cancelButton.leadingAnchor.constraint(equalTo: searchStackView.trailingAnchor, constant: 10),
            
            pinButton.topAnchor.constraint(equalTo: searchStackView.topAnchor, constant: 12),
            pinButton.leadingAnchor.constraint(equalToSystemSpacingAfter: searchStackView.leadingAnchor, multiplier: 1),
            pinButton.heightAnchor.constraint(equalToConstant: 26),
            pinButton.widthAnchor.constraint(equalToConstant: 26),
            
            searchField.heightAnchor.constraint(equalToConstant: 20),
            searchField.leadingAnchor.constraint(equalTo: pinButton.trailingAnchor, constant: 7),
            searchField.topAnchor.constraint(equalTo: searchStackView.topAnchor, constant: 15),
            searchStackView.trailingAnchor.constraint(equalTo: searchField.trailingAnchor, constant: 15),
            
            cancelButton.heightAnchor.constraint(equalToConstant: 20),
            cancelButton.widthAnchor.constraint(equalToConstant: 50),
            cancelButton.topAnchor.constraint(equalToSystemSpacingBelow: searchStackView.topAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: cancelButton.trailingAnchor, multiplier: 2),
            
            tableView.topAnchor.constraint(equalToSystemSpacingBelow: searchStackView.bottomAnchor, multiplier: 3),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor)
            
        ])
    }

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath)
        let location = cities[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Avenir-Medium", size: 15)
//        cell.textLabel?.textColor = .black
        cell.textLabel?.text = location
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        dismiss(animated: true) {
            print(self.cities[indexPath.row])
        }
    }
    
    
}
