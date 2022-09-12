//
//  StorageManager.swift
//  app-Thoughts
//
//  Created by Jean Ricardo Cesca on 12/09/22.
//

import Foundation
import FirebaseStorage
import UIKit

final class StorageManager {
    
    static let shared = StorageManager()
    
    private let container = Storage.storage().reference()
    
    private init() {}
    
    public func uploadUserProfilePicture(email: String, image: UIImage?, completion: @escaping (Bool) -> Void) {
        
        
    }
    
    public func downloadUrlForProfilePicture(user: User, completion: @escaping (URL?) -> Void) {
        
        
    }
    
    public func uploadHeaderImage(post: BlogPost, image: UIImage?, completion: @escaping (Bool) -> Void) {
        
        
    }
    
    public func downloadUrlForPostHeader(post: BlogPost, completion: @escaping (URL?) -> Void) {
        
        
    }

    
    
}

