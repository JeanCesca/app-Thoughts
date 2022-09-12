//
//  DatabaseManager.swift
//  app-Thoughts
//
//  Created by Jean Ricardo Cesca on 12/09/22.
//

import Foundation
import FirebaseFirestore

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Firestore.firestore()
    
    private init() {}
    
    public func insertBlogPost(with post: BlogPost, user: User, completion: @escaping (Bool) -> Void) {
        
        
    }
    
    public func getAllPosts(completion: @escaping ([BlogPost]) -> Void) {
        
        
    }
    
    public func getPostsForUser(for user: User, completion: @escaping ([BlogPost]) -> Void) {
        
        
    }
    
    public func insertUser(user: User, completion: @escaping (Bool) -> Void) {
        
        
    }
    
}
