//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Никита on 18.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    
    let newButton: UIButton = {
        
        let button = UIButton()
        
        button.backgroundColor = .green
        button.setTitle("New Button", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.layer.cornerRadius = 16 // Поправить до нужного радиуса
        button.layer.masksToBounds = false // Обязательно, если хотим видеть тень
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.opacity = 0.7
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        //button.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        self.view.addSubview(profileHeaderView)
        self.view.addSubview(newButton)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupConstraints()
        
        profileHeaderView.backgroundColor = .lightGray
        profileHeaderView.carImageView.layer.cornerRadius = profileHeaderView.carImageView.frame.height / 2
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeaderView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            newButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            newButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
            
        ])
        
    }
    
}


