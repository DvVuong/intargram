//
//  SigupViewModel.swift
//  IntargramHandmade
//
//  Created by BeeTech on 06/03/2023.
//

import Foundation
import RxSwift
class SigupViewModel {
    //MARK: - Publisher
    var tfEmailPublisher = PublishSubject<String>()
    var tfUserNamePublisher = PublishSubject<String>()
    var tfPasswordPublisher = PublishSubject<String>()
    var tfFullNamePublisher = PublishSubject<String>()
    //MARK: - Error
    var emailErrorBehaviorSubject = BehaviorSubject<String?>(value: nil)
    var UserNameErrorBehaviorSubject = BehaviorSubject<String?>(value: nil)
    var passwordErrorBehaviorSubject = BehaviorSubject<String?>(value: nil)
    var fullNameErrorBehaviorSubject = BehaviorSubject<String?>(value: nil)
    
    var firebaseService: FirebaseService = FirebaseService()
    var isEnableButton = PublishSubject<Bool>()
    var bag = DisposeBag()
    
    init() {
        tfFullNamePublisher.map({self.validateFullName($0)}).subscribe(onNext: {[weak self] valiPair in
            self?.fullNameErrorBehaviorSubject.onNext(valiPair.1 ?? "")
        }).disposed(by: bag)
        
        tfEmailPublisher.map({self.validateEmail($0)}).subscribe(onNext: {[weak self] valiPair in
            self?.emailErrorBehaviorSubject.onNext(valiPair.1 ?? "")
        }).disposed(by: bag)
        
        tfPasswordPublisher.map({self.validatePassword($0)}).subscribe(onNext: {[weak self] valiPair in
            self?.passwordErrorBehaviorSubject.onNext(valiPair.1 ?? "")
        }).disposed(by: bag)
        
        tfUserNamePublisher.map({self.validateUserName($0)}).subscribe(onNext: {[weak self] valiPair in
            self?.UserNameErrorBehaviorSubject.onNext(valiPair.1 ?? "")
        }).disposed(by: bag)
    }
    //MARK: - SiginUser
    func sigUpUser(_ email: String, password: String, name: String, fullName: String) {
        print("vuongdv email: \(email)")
        self.firebaseService.sigUpUser(email, password: password, name: name, fullName: fullName)
    }
    
    //MARK: - Validate,Email, Password
    func validateEmail(_ email: String) -> (Bool, String?) {
        if email.isEmpty {
            return (false, L10n.emailCannotBeEmpty)
        }
        if !isValidEmail(email: email) {
            return (false, L10n.emailInvalidate)
        }
        return (true, "")
    }
    
    func validateUserName(_ userName: String) -> (Bool, String?) {
        if userName.isEmpty {
            return (false, L10n.userNameCannotEmpty)
        }
        return (true, "")
    }
    
    func validateFullName(_ fullname: String) -> (Bool, String?) {
        if fullname.isEmpty {
            return (false, L10n.fullNameCannotEmpty)
        }
        return (true, "")
    }

    func validatePassword(_ password: String) -> (Bool, String?) {
        if password.isEmpty {
            return (false, L10n.passwordCannotBeEmpty)
        }
        if password.count < 8 {
            return (false, L10n.passwordMustBeMoreThan8Characters)
        }
        return (true, "")
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
