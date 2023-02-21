//
//  FeedViewController.swift
//  Navigation
//
//  Created by Никита on 16.02.2023.
//
import UIKit

class FeedViewController: UIViewController {
    private let newPostTitle = Post(title: "Latest News")

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Go to post", for: .normal)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        view.addSubview(button)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)]) }

    @objc private func tapButton() {
        let postViewController = PostViewController()
        postViewController.postTitle = newPostTitle
        navigationController?.pushViewController(postViewController, animated: true)
    }
}


