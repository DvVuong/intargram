//
//  SigUpViewController.swift
//  IntargramHandmade
//
//  Created by BeeTech on 06/03/2023.
//

import UIKit
import RxSwift
import RxCocoa

class SigUpViewController: UIViewController {
    static func instance() -> SigUpViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpScreen") as! SigUpViewController
        return vc
    }
    
    @IBOutlet weak var tfPhonenumberOrEmail: UITextField!
    @IBOutlet weak var tfFullName: UITextField!
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var lbErrorEmail: UILabel!
    @IBOutlet weak var lbFullNameError: UILabel!
    @IBOutlet weak var lbUserNameError: UILabel!
    @IBOutlet weak var lbPasswordError: UILabel!
    @IBOutlet weak var btnSigin: UIButton!
    var viewModel: SigupViewModel = SigupViewModel()
    var bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindUI()
        bind()
    }
    
    private func bind() {
        viewModel.siginUser()
    }
    
    private func setupUI() {
        btnSigin.isEnabled = false
        lbErrorEmail.isHidden = true
        lbPasswordError.isHidden = true
        lbUserNameError.isHidden = true
        lbFullNameError.isHidden = true
        tfUserNameAndPassword()
        setupButton()
    }
    
    private func bindUI() {
        viewModel.emailErrorBehaviorSubject.bind(to: lbErrorEmail.rx.text).disposed(by: bag)
        lbErrorEmail.isHidden = false
        
        viewModel.fullNameErrorBehaviorSubject.bind(to: lbFullNameError.rx.text).disposed(by: bag)
        lbFullNameError.isHidden = false
        
        viewModel.UserNameErrorBehaviorSubject.bind(to: lbUserNameError.rx.text).disposed(by: bag)
        lbUserNameError.isHidden = false
        
        viewModel.passwordErrorBehaviorSubject.bind(to: lbPasswordError.rx.text).disposed(by: bag)
        lbPasswordError.isHidden = false
        //MARK: - EnableButtonSigin
        Observable.combineLatest(viewModel.emailErrorBehaviorSubject.map({$0 == ""})
                                 , viewModel.fullNameErrorBehaviorSubject.map({$0 == ""})
                                 , viewModel.UserNameErrorBehaviorSubject.map({$0 == ""})
                                 , viewModel.passwordErrorBehaviorSubject.map({$0 == ""})).map({$0.0 && $0.1 && $0.2 && $0.3})
            .withUnretained(self)
            .subscribe(onNext: {owner, ishow in
                //owner.lbErrorEmail.isHidden = ishow
                owner.btnSigin.isEnabled = ishow
                
            }).disposed(by: bag)
        
    }
    
    private func tfUserNameAndPassword() {
        tfUserName.rx.controlEvent(.editingChanged).map({[weak self] textField in
            return self?.tfUserName.text
        }).subscribe(onNext: {[weak self] text in
            self?.viewModel.tfUserNamePublisher.onNext(text ?? "")
        }).disposed(by: bag)
        
        tfFullName.rx.controlEvent(.editingChanged).map({[weak self] textFiled in
            return self?.tfFullName.text
        })
        .withUnretained(self)
        .subscribe(onNext: { owner, text in
            owner.viewModel.tfFullNamePublisher.onNext(text ?? "")
        }).disposed(by: bag)
        
        tfPassword.rx.controlEvent(.editingChanged).map({[weak self] textField in
            return self?.tfPassword.text
        }).subscribe(onNext: {[weak self] text in
            self?.viewModel.tfPasswordPublisher.onNext(text ?? "")
        }).disposed(by: bag)
        
        tfPhonenumberOrEmail.rx.controlEvent(.editingChanged).map({[weak self] textFiled in
            return self?.tfPhonenumberOrEmail.text
        }).withUnretained(self)
        .subscribe(onNext: { owner, text in
            owner.viewModel.tfEmailPublisher.onNext(text ?? "")
        }).disposed(by: bag)
    }
    
    private func setupButton() {
        //MARK: - Button
        btnSigin.rx.controlEvent(.touchUpInside)
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                owner.viewModel.siginUser()
            }).disposed(by: bag)
    }
}
