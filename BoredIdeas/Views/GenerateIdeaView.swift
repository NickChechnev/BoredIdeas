//
//  GenerateIdeaView.swift
//  BoredIdeas
//
//  Created by Никита Чечнев on 22.05.2023.
//

import UIKit

final class GenerateIdeaView: UIView {
    
    private let viewModel = BIViewModel()

    private let activityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(activityLabel)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemFill
        setupConstraints()
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Not supported")
    }
    
    private func setupView() {
        layer.cornerRadius = 15
        layer.cornerCurve = .continuous
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            activityLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            activityLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityLabel.widthAnchor.constraint(equalToConstant: 300),
            activityLabel.heightAnchor.constraint(equalToConstant: 150)
            
        ])
    }
}
