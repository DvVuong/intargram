//
//  SigninViewModel.swift
//  IntargramHandmade
//
//  Created by BeeTech on 06/03/2023.
//

import Foundation
import RxSwift

class SigInViewModel {
    var tfEmailPublisher = PublishSubject<String>()
    var tfPasswordPublisher = PublishSubject<String>()
    var emailPasswordPublisher = PublishSubject<(String, String)>()
    var firebaseService: FirebaseService = FirebaseService()
    var isEnableButton = PublishSubject<Bool>()
    var bag = DisposeBag()
    init() {
       
    }
    //MARK: - SiginUser
    func sigInUser(_ email: String, password: String, completed: @escaping (Bool, String) -> Void) {
        firebaseService.sigInUser(email, password: password, completed: { bool, text in
            
            completed(bool, text ?? "")
        })
    }
    
}
