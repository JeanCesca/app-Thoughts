//
//  AuthManager.swift
//  app-Thoughts
//
//  Created by Jean Ricardo Cesca on 12/09/22.
//

import Foundation
import FirebaseAuth

/* AuthManager responsável por:
    1. Criar a conta do usuário
    1. Logar o usuário
    2. Deslogar o usuário
    3. Saber se o usuário está logado
 */

final class AuthManager {
    
    static let shared = AuthManager()
    
    private let auth = Auth.auth()
    
    private init() {}
    
    //Se o usuário não for nulo, sabemos que está logado
    public var isSignIn: Bool {
        return auth.currentUser != nil
    }
    
    //Criar a conta do usuário. MAS também queremos inserir o usuário no Database
    public func signUp(email: String, password: String, completion: @escaping (Bool) -> Void) {
        guard !email.isEmpty,
              !password.isEmpty,
              password.count >= 6
        else { return }
        
        auth.createUser(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                completion(false)
                return
            }
            //conta criada
            completion(true)
        }
    }
    
    //Loga o usuário.
    public func signIn(email: String, password: String, completion: @escaping (Bool) -> Void) {
        //verificar as condições
        guard !email.isEmpty,
              !password.isEmpty,
              password.count >= 6
        else { return }
        
        auth.signIn(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                completion(false)
                return
            }
            //conta logada
            completion(true)
        }
    }
    
    //Loga o usuário.
    public func signOut(completion: (Bool) -> Void) {
        do {
            try auth.signOut()
            completion(true)
        } catch {
            print("Error ao deslogar")
            completion(false)
        }
    }
}
