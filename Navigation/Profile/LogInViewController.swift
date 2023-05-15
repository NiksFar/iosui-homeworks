//
//  LogInViewController.swift
//  Navigation
//
//  Created by Никита on 28.04.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    var logo: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "logo")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var loginTF: UITextField = {
        
        let textField = UITextField()
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        textField.layer.borderWidth = 0.5
        textField.placeholder = "E-mail or phone"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height)) // Добавляем маленькую вьюшку(белый прямоугольник) - для отступа от края textField
        textField.leftViewMode = .always
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        textField.backgroundColor = UIColor.systemGray5
        //textField.tintColor =
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
        
    }()
    
    var passwordTF: UITextField = {
        
        let textField = UITextField()
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        textField.layer.borderWidth = 0.5
        textField.placeholder = "Password"
        /////////////////////////////
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height)) // Добавляем маленькую вьюшку(белый прямоугольник) - для отступа от края textField
        textField.leftViewMode = .always
        /////////////////////////////
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        textField.backgroundColor = UIColor.systemGray5
        //textField.tintColor =
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
        
    }()
    
    let logInButton: UIButton = {
        
        let button = UIButton()
        
        let alphaImage = UIImage(named: "pixelImage")
        
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10 // Поправить до нужного радиуса
        
        button.setBackgroundImage(UIImage(named: "pixelImage"), for: .normal)
        button.layer.masksToBounds = true
        //button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Обработка нажатия кнопки
    @objc func buttonPressed() {
        
        let vc = ProfileViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        
    }

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let contentView: UIView = {
        
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        setupView()
        
    }
    /////////////////////////////
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            view.endEditing(true) // Скрывает клавиатуру, вызванную для любого объекта
        }
    /////////////////////////////
    private func setupView() {
        
        self.view.addSubview(scrollView)
        self.view.addSubview(contentView)
        self.view.addSubview(logo)
        self.view.addSubview(loginTF)
        self.view.addSubview(passwordTF)
        self.view.addSubview(logInButton)
        self.setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            logo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            logo.heightAnchor.constraint(equalToConstant: 100),
            logo.widthAnchor.constraint(equalToConstant: 100),
            
            loginTF.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 80),
            loginTF.heightAnchor.constraint(equalToConstant: 50),
            loginTF.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginTF.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            passwordTF.topAnchor.constraint(equalTo: loginTF.bottomAnchor, constant: -0.5),
            passwordTF.heightAnchor.constraint(equalToConstant: 50),
            passwordTF.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            passwordTF.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            logInButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
            
        ])
    }
    
}
