//
//  PayWallDescriptionView.swift
//  app-Thoughts
//
//  Created by Jean Ricardo Cesca on 13/09/22.


import Foundation
import UIKit

class PayWallDescriptionView: UIView {

    private let descriptorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.numberOfLines = 0
        label.text = "Join Thoughts Premium to read unlimited articles and browse thousands of posts."
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "$4.99 / month"
        label.numberOfLines = 1
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(descriptorLabel)
        addSubview(priceLabel)
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureConstraints() {
        NSLayoutConstraint.activate([
            descriptorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptorLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -16),
            descriptorLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            priceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            priceLabel.centerYAnchor.constraint(equalTo: centerYAnchor)

        ])
    }
}
