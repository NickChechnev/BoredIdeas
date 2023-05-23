//
//  IdeaConstructorVC.swift
//  BoredIdeas
//
//  Created by Никита Чечнев on 19.05.2023.
//

import UIKit

final class IdeaConstructorVC: UIViewController {
    
    private let typeArr: [String] = ["Education", "Recreational", "Social", "DIY", "Charity", "Cooking", "Relaxation", "Music", "Busywork"]
    private let participantsArr: [Int] = [1, 2, 3, 4]
    
    private lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private lazy var constructButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .secondaryLabel
        button.addTarget(self, action: #selector(ideaGenerated), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerCurve = .continuous
        button.layer.cornerRadius = 50
        button.setTitle("🛠", for: .normal)
        return button
    }()
    
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.text = "Selected type: Educational"
        label.layer.masksToBounds = true
        label.layer.cornerCurve = .continuous
        label.layer.cornerRadius = 10
        label.textAlignment = .center
        label.backgroundColor = .systemFill
        return label
    }()
    
    private lazy var participantsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.text = "Number of participants: 2"
        label.layer.masksToBounds = true
        label.layer.cornerCurve = .continuous
        label.layer.cornerRadius = 10
        label.textAlignment = .center
        label.backgroundColor = .systemFill
        return label
    }()

    var completionHandler: ((String, Int) -> (String, Int))?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(pickerView)
        view.addSubview(typeLabel)
        view.addSubview(participantsLabel)
        view.addSubview(constructButton)
        navigationItem.title = "Choose options to generate an Idea"
        pickerView.dataSource = self
        pickerView.delegate = self
        NSLayoutConstraint.activate([
            pickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pickerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200),
            pickerView.heightAnchor.constraint(equalToConstant: 250),
            
            typeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            typeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            typeLabel.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 90),
            typeLabel.heightAnchor.constraint(equalToConstant: 50),
            
            participantsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            participantsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            participantsLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 5),
            participantsLabel.heightAnchor.constraint(equalToConstant: 50),
            
            constructButton.heightAnchor.constraint(equalToConstant: 100),
            constructButton.widthAnchor.constraint(equalToConstant: 100),
            constructButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 230),
            constructButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func ideaGenerated() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension IdeaConstructorVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return typeArr.count
        } else {
            return participantsArr.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            let typeTitle = typeArr[row]
            DispatchQueue.main.async {
                self.typeLabel.text = "Type of Idea: \(typeTitle)"
            }
            return typeTitle
        } else {
            let numberTitle = String(participantsArr[row])
            DispatchQueue.main.async {
                self.participantsLabel.text = "Number of participants: \(numberTitle)"
            }
            return numberTitle
        }
    }
}
