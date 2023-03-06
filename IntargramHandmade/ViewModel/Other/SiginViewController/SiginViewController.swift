//
//  ViewController.swift
//  IntargramHandmade
//
//  Created by BeeTech on 06/03/2023.
//

import UIKit
import RxSwift
import RxCocoa
class SiginViewController: UIViewController {
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnSigUp: UIButton!
    @IBOutlet weak var btnLoigInFaceBook: UIButton!
    @IBOutlet weak var btnShowPassword: UIButton!
    
    var bag = DisposeBag()
    var viewModel: SigninViewModel = SigninViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindUI()
    }
    
    private func bindUI() {
        viewModel.siginUser()
        
        //MARK: - Button
        btnLogin.rx.controlEvent(.touchUpInside)
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                owner.viewModel.siginUser()
                print("vuongdv: Tap Tap Tap")
            }).disposed(by: bag)
        
        btnSigUp.rx.controlEvent(.touchUpInside)
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                let vc = SigUpViewController.instance()
                self.present(vc, animated: true)
            }).disposed(by: bag)
    }
    
    private func setupUI() {
        btnShowPassword.setTitle("", for: .normal)
        tfUserNameAndPassword()
    }
    
    private func tfUserNameAndPassword() {
        tfUserName.rx.controlEvent(.editingChanged).map({[weak self] textField in
            return self?.tfUserName.text
        }).subscribe(onNext: {[weak self] text in
            self?.viewModel.tfEmailPublisher.onNext(text ?? "")
        }).disposed(by: bag)
        
        tfPassword.rx.controlEvent(.editingChanged).map({[weak self] textField in
            return self?.tfPassword.text
        }).subscribe(onNext: {[weak self] text in
            self?.viewModel.tfPasswordPublisher.onNext(text ?? "")
        }).disposed(by: bag)
    }


}

