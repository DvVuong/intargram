//
//  FirebaseService.swift
//  IntargramHandmade
//
//  Created by BeeTech on 06/03/2023.
//

import Foundation
import FirebaseAuth

class FirebaseService {
   
    
    //MARK: - Sigin User
    func siginUser(_ email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authenSult, error in
            guard let authenSult = authenSult, let _ = error else {return}
            print("vuongdv: \(authenSult.user)")
        }
    }
}
