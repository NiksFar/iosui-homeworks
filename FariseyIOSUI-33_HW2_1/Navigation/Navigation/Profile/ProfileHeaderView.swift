import UIKit

class ProfileHeaderView: UIView {
    
    
    let carImageView: UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "Image1")
        imageView.clipsToBounds = true // Чтобы изображение не выходило за пределы круга
        imageView.contentMode = .scaleAspectFill // Ресайз контента под фрейм
        imageView.layer.borderWidth = 3 // Ширина рамки 3пт
        imageView.layer.borderColor = UIColor.white.cgColor // Задаем цвет рамки
        imageView.layer.cornerRadius = 75 // Height/2
        
        return imageView
    }()
    
    let statusButton: UIButton = {
        
        let button = UIButton()
        
        button.backgroundColor = .blue
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16 // Поправить до нужного радиуса
        button.layer.masksToBounds = false // Обязательно, если хотим видеть тень
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.opacity = 0.7
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
    }()
    
    // Обработка нажатия кнопки
    @objc func buttonPressed() {
        print(statusLabel.text ?? "No status")
    }
    
    let profileLabel: UILabel = {
        
        let label = UILabel()
        
        label.text = "Hipster Car"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    let statusLabel: UILabel = {
        
        let secondaryLabel = UILabel()
        
        secondaryLabel.text = "Waiting for a ride"
        secondaryLabel.font = .systemFont(ofSize: 14, weight: .regular)
        secondaryLabel.textColor = .gray
        
        return secondaryLabel
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(carImageView)
        self.addSubview(profileLabel)
        self.addSubview(statusLabel)
        self.addSubview(statusButton)
        
        self.carImageView.translatesAutoresizingMaskIntoConstraints = false
        self.statusLabel.translatesAutoresizingMaskIntoConstraints = false
        self.profileLabel.translatesAutoresizingMaskIntoConstraints = false
        self.statusButton.translatesAutoresizingMaskIntoConstraints = false
        
        [
            // Подгоняем картинку
            carImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            carImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            carImageView.heightAnchor.constraint(equalToConstant: 150),
            carImageView.widthAnchor.constraint(equalToConstant: 150),
            
            // Подгоняем profileLabel
            profileLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            profileLabel.leadingAnchor.constraint(equalTo: carImageView.trailingAnchor, constant: 15),
            profileLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            // Подгоняем statusLabel
            statusLabel.topAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34),
            statusLabel.leadingAnchor.constraint(equalTo: carImageView.trailingAnchor, constant: 15),
            statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            // Подгоняем кнопку
            statusButton.topAnchor.constraint(equalTo: carImageView.bottomAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16)
            
        ].forEach{$0.isActive = true}
        
    }
    
}
