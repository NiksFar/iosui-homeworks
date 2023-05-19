//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Никита on 18.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    
    let posts: [Post] = [
    
        Post(author: "NotMe", description: "Name Post", image: "apple_logo", likes: 10, views: 10),
        Post(author: "Me1", description: "Name Post", image: "apple", likes: 15, views: 25),
        Post(author: "Me2", description: "Name Post", image: "cube", likes: 20, views: 45),
        Post(author: "Me3", description: "Name Post", image: "ball", likes: 30, views: 65),
        Post(author: "Me4", description: "Name Post", image: "happy", likes: 40, views: 85),
    ]
    
//    let newButton: UIButton = {
//
//        let button = UIButton()
//
//        button.backgroundColor = .green
//        button.setTitle("New Button", for: .normal)
//        button.setTitleColor(.red, for: .normal)
//        button.layer.cornerRadius = 16 // Поправить до нужного радиуса
//        button.layer.masksToBounds = false // Обязательно, если хотим видеть тень
//        button.layer.shadowOffset = CGSize(width: 4, height: 4)
//        button.layer.shadowRadius = 4
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.opacity = 0.7
//        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
//
//        return button
//    }()
    
    let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //print(#function) - Проверка этапов исполнения кода
        tabBarController?.tabBar.isHidden = false
        self.view.backgroundColor = .gray
       // self.view.addSubview(profileHeaderView)
        self.view.addSubview(tableView)
        //tableView.separatorStyle = .none // - убираем разделяющие линии
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell") // - регистрируем ячейку
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setupView() {
        print(#function)
        //profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        profileHeaderView.backgroundColor = .lightGray
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
       
        setupConstraints()
        
        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.setupView()
        profileHeaderView.carImageView.layer.cornerRadius = self.view.frame.width * 0.15
    }
    
    private func setupConstraints() {
        print(profileHeaderView.carImageView.frame.height,"До настройки")
        NSLayoutConstraint.activate([
        
//            profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
//            profileHeaderView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
//            profileHeaderView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
//            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        print(profileHeaderView.carImageView.frame.height,"после настройки")
    }

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
        let post = posts[indexPath.row]
        cell.setData(post: post)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return profileHeaderView
        } else {
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 220
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        self.view.frame.width + 130
    }
    
}
