//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Никита on 18.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(#function)- Проверка этапов исполнения кода
        
        self.view.addSubview(profileHeaderView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = self.view.frame
        profileHeaderView.backgroundColor = .lightGray
    }
    
}

