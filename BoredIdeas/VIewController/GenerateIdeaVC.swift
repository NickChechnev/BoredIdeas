//
//  GenerateIdeaVC.swift
//  BoredIdeas
//
//  Created by Никита Чечнев on 18.05.2023.
//

import UIKit

final class GenerateIdeaVC: UIViewController {
    
    private let generateIdeaView = GenerateIdeaView()
    
    private lazy var constructButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .secondaryLabel
        button.addTarget(self, action: #selector(generateButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerCurve = .continuous
        button.layer.cornerRadius = 50
        button.setTitle("🛠", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(constructButton)
        view.addSubview(generateIdeaView)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        NSLayoutConstraint.activate([
            generateIdeaView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            generateIdeaView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
            generateIdeaView.heightAnchor.constraint(equalToConstant: 220),
            generateIdeaView.widthAnchor.constraint(equalToConstant: 350),
            
            constructButton.heightAnchor.constraint(equalToConstant: 100),
            constructButton.widthAnchor.constraint(equalToConstant: 100),
            constructButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 230),
            constructButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func generateButtonTap() {
        let vc = IdeaConstructorVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
