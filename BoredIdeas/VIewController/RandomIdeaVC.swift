//
//  ViewController.swift
//  BoredIdeas
//
//  Created by Никита Чечнев on 17.05.2023.
//

import UIKit

class RandomIdeaVC: UIViewController {
    
    lazy var testButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemCyan
        button.addTarget(self, action: #selector(testButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerCurve = .continuous
        button.layer.cornerRadius = 50
        button.setTitle("❔", for: .normal)
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 3
        button.layer.shadowOpacity = 10
        return button
    }()
    
    lazy var activityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        label.isHidden = true
        label.alpha = 0
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(testButton)
        view.addSubview(activityLabel)
        view.backgroundColor = .systemBackground
        NSLayoutConstraint.activate([
            testButton.heightAnchor.constraint(equalToConstant: 100),
            testButton.widthAnchor.constraint(equalToConstant: 100),
            testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200),
            
            activityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            activityLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            activityLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            activityLabel.bottomAnchor.constraint(equalTo: testButton.topAnchor, constant: 10)
            
        ])
    }
    
    @objc func testButtonTap() {
        BIDataManager.shared.fetch("https://www.boredapi.com/api/activity/", expecting: Activity.self) { result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async { [weak self] in
                    self?.activityLabel.isHidden = false
                    self?.activityLabel.text = success.activity
                    UIView.animate(withDuration: 0.3) {
                        self?.activityLabel.alpha = 1
                    }
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }


}

