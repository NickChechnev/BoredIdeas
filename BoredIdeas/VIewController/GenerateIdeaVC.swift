//
//  GenerateIdeaVC.swift
//  BoredIdeas
//
//  Created by Никита Чечнев on 18.05.2023.
//

import UIKit

class GenerateIdeaVC: UIViewController {
    
    lazy var generateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.addTarget(self, action: #selector(generateButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerCurve = .continuous
        button.layer.cornerRadius = 50
        button.setTitle("🛠", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(generateButton)
        NSLayoutConstraint.activate([
            generateButton.heightAnchor.constraint(equalToConstant: 100),
            generateButton.widthAnchor.constraint(equalToConstant: 100),
            generateButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200),
            generateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func generateButtonTap() {
        print("Generated")
    }
}
