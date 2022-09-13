//
//  ProfileViewController.swift
//  app-Thoughts
//
//  Created by Jean Ricardo Cesca on 12/09/22.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        view.backgroundColor = .systemBackground
        setUpNavigation()
    }
    
    private func setUpNavigation() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(didTapSignOut))
    }
    
    @objc private func didTapSignOut() {
        
        let alertSheet = UIAlertController(title: "Sign Out", message: "Are you sure you'd like to sign out?", preferredStyle: .actionSheet)
        present(alertSheet, animated: true, completion: nil)
        
        alertSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertSheet.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { _ in
            
            AuthManager.shared.signOut { [weak self] success in
                if success {
                    DispatchQueue.main.async {
                        
                        UserDefaults.standard.set(nil, forKey: "email")
                        UserDefaults.standard.set(nil, forKey: "password")
                        
                        let vc = SignInViewController()
                        vc.modalPresentationStyle = .overFullScreen
                        let nav = UINavigationController(rootViewController: vc)
                        self?.present(nav, animated: true, completion: nil)
                        
                    }
                }
            }
        }))
    }
}
