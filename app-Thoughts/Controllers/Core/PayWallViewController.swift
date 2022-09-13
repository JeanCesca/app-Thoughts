//
//  PayWallViewController.swift
//  app-Thoughts
//
//  Created by Jean Ricardo Cesca on 13/09/22.
//

import UIKit

class PayWallViewController: UIViewController {
    
    private let headerView = PayWallHeaderView()
    private let heroView = PayWallDescriptionView()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let buyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Subscribe", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(button.self, action: #selector(didTapSubscribe), for: .touchUpInside)
        return button
    }()
    
    private let restoreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Restore Purchases", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(button.self, action: #selector(didTapRestore), for: .touchUpInside)
        return button
    }()
    
    private let termsView: UILabel = {
        let textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.textColor = .secondaryLabel
        textView.numberOfLines = 0
        textView.lineBreakMode = .byWordWrapping
        textView.font = .systemFont(ofSize: 14, weight: .regular)
        textView.text = "This is an auto-renewable Subscription. It will be charged to your iTunes account before each pay period. You can cancel anytime by going into your Setttings > Subscriptions. Restore purchases if previously subscribed."
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Thoughts Premium"
        
        view.backgroundColor = .systemBackground
        setUpCloseButton()
        configureConstraints()
    }
    
    private func setUpCloseButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapClose))
    }

    @objc private func didTapClose() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapSubscribe() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapRestore() {
        dismiss(animated: true, completion: nil)
    }
    
    private func configureConstraints() {
        view.addSubview(headerView)
        view.addSubview(termsView)
        view.addSubview(buyButton)
        view.addSubview(restoreButton)
        view.addSubview(heroView)
        
        headerView.clipsToBounds = true
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        heroView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 250),
            
            heroView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            heroView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            heroView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            heroView.bottomAnchor.constraint(equalTo: buyButton.topAnchor),
            
            buyButton.centerXAnchor.constraint(equalTo: restoreButton.centerXAnchor),
            buyButton.leadingAnchor.constraint(equalTo: restoreButton.leadingAnchor),
            buyButton.trailingAnchor.constraint(equalTo: restoreButton.trailingAnchor),
            buyButton.bottomAnchor.constraint(equalTo: restoreButton.topAnchor, constant: -8),
            buyButton.heightAnchor.constraint(equalToConstant: 50),
            
            restoreButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            restoreButton.leadingAnchor.constraint(equalTo: termsView.leadingAnchor),
            restoreButton.trailingAnchor.constraint(equalTo: termsView.trailingAnchor),
            restoreButton.bottomAnchor.constraint(equalTo: termsView.topAnchor, constant: -30),
            
            termsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            termsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            termsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            termsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

        ])
    }

}
