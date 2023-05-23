//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Никита on 18.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    
    let posts = DataService.posts
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tabBarController?.tabBar.isHidden = false
        self.view.backgroundColor = .gray
        self.view.addSubview(tableView)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell") // - регистрируем ячейку
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotoCell")
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setupView() {
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
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return posts.count
        } else {
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
            let post = posts[indexPath.row]
            cell.setData(post: post)
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotosTableViewCell
            cell.backgroundColor = .systemGray3
            cell.setData(data: DataService.array)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let vc = PhotosViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
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
        if indexPath.section == 1 {
            return self.view.frame.width + 130
        } else {
            let height = ((self.view.frame.width - 48) / 4) + 60
            return height
        }
    }
}
