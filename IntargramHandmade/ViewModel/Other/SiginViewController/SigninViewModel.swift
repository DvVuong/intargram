//
//  SigninViewModel.swift
//  IntargramHandmade
//
//  Created by BeeTech on 06/03/2023.
//

import Foundation
import RxSwift

class SigninViewModel {
    var tfEmailPublisher = PublishSubject<String>()
    var tfPasswordPublisher = PublishSubject<String>()
    var firebaseService: FirebaseService = FirebaseService()
    var isEnableButton = PublishSubject<Bool>()
    var bag = DisposeBag()
    init() {
        
    }
    //MARK: - SiginUser
    func siginUser() {
        Observable.combineLatest(tfEmailPublisher, tfPasswordPublisher).subscribe(onNext: {[weak self] text in
            self?.firebaseService.siginUser(text.0, password: text.1)
        }).disposed(by: bag)
    }
    
    
    
    //MARK: - Validate,Email, Password
    func validateEmail(_ email: String) -> (Bool, String?) {
        if email.isEmpty {
            return (false, L10n.emailCannotBeEmpty)
        }
        if !isValidEmail(email: email) {
            return (false, L10n.emailInvalidate)
        }
        return (true, nil)
    }

    func validatePassword(_ password: String) -> (Bool, String?) {
        if password.isEmpty {
            return (false, L10n.passwordCannotBeEmpty)
        }
        if password.count < 8 {
            return (false, L10n.passwordMustBeMoreThan8Characters)
        }
        return (true, nil)
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
}
