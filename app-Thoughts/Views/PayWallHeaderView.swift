//
//  PayWallHeaderView.swift
//  app-Thoughts
//
//  Created by Jean Ricardo Cesca on 13/09/22.
//

import Foundation
import UIKit

class PayWallHeaderView: UIView {

    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "crown.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemPink
        
        addSubview(headerImageView)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            headerImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerImageView.widthAnchor.constraint(equalToConstant: 100),
            headerImageView.heightAnchor.constraint(equalToConstant: 100),
            
        ])
    }
}
