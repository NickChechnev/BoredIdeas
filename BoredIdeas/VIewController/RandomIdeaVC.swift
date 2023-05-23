//
//  ViewController.swift
//  BoredIdeas
//
//  Created by Никита Чечнев on 17.05.2023.
//

import UIKit

final class RandomIdeaVC: UIViewController {
    
    private let randomIdeaView = RandomIdeaView()
    
    private lazy var getIdea: UIButton = {
        let button = UIButton()
        button.backgroundColor = .secondaryLabel
        button.addTarget(self, action: #selector(getIdeaButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerCurve = .continuous
        button.layer.cornerRadius = 50
        button.setTitle("❔", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(getIdea)
        view.addSubview(randomIdeaView)
        view.backgroundColor = .secondarySystemBackground
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            randomIdeaView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            randomIdeaView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
            randomIdeaView.heightAnchor.constraint(equalToConstant: 220),
            randomIdeaView.widthAnchor.constraint(equalToConstant: 350),
            
            getIdea.heightAnchor.constraint(equalToConstant: 100),
            getIdea.widthAnchor.constraint(equalToConstant: 100),
            getIdea.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getIdea.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 230)
            ])
    }
    
   @objc func getIdeaButtonTap() {
        randomIdeaView.setActivityLabelText()
    }
}

