//
//  SignInViewController.swift
//  app-Thoughts
//
//  Created by Jean Ricardo Cesca on 12/09/22.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sign In"
        view.backgroundColor = .systemBackground
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            if IAPManager.shared.isPremium() {
                let nav = UINavigationController(rootViewController: PayWallViewController())
                self.present(nav, animated: true, completion: nil)
            }
        }
    }

}
