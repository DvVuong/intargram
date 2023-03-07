//
//  FirebaseService.swift
//  IntargramHandmade
//
//  Created by BeeTech on 06/03/2023.
//

import Foundation
import FirebaseAuth
import Firebase
class FirebaseService {

    private let _db = Firestore.firestore()
    private let _user = "User"
    
    //MARK: - Sigin, SigUp User
    func sigUpUser(_ email: String, password: String, name: String, fullName: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authenSult, error in
            if error != nil {return}
            
            if let data = authenSult {
                let idUser = data.user.uid
                let data = ["email": email,
                            "password": password,
                            "id": idUser,
                            "userName": name,
                            "fullName": fullName
                ]
                self._db.collection(self._user).document(idUser).setData(data)
            }
        }
    }
    
    func sigInUser(_ email: String, password: String, completed: @escaping (Bool, String?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authenResult, error in
            if error != nil   {
                completed(false, error!.localizedDescription)
            }
            if authenResult != nil {
                completed(true, nil)
            }

        }
    }
}
