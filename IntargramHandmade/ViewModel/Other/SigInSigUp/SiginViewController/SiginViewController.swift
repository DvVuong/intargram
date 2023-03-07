//
//  ViewController.swift
//  IntargramHandmade
//
//  Created by BeeTech on 06/03/2023.
//

import UIKit
import RxSwift
import RxCocoa
import Toaster
class SiginViewController: UIViewController {
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnSigUp: UIButton!
    @IBOutlet weak var btnLoigInFaceBook: UIButton!
    @IBOutlet weak var btnShowPassword: UIButton!
    
    private var isShow: Bool = true
    private var bag = DisposeBag()
    private var viewModel: SigInViewModel = SigInViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindUI()
    }
    
    private func setupUI() {
        btnShowPassword.setTitle("", for: .normal)
        tfUserName.text = "long@gmail.com"
        tfPassword.text = "12345678"
        setuptextFied()
    }
    
    private func setuptextFied() {
        tfUserName.rx.controlEvent(.editingChanged).map({[weak self] textField in
            return self?.tfUserName.text
        })
        .withUnretained(self)
        .subscribe(onNext: { owner,text in
            owner.viewModel.tfEmailPublisher.onNext(text ?? "")
        }).disposed(by: bag)
        
        tfPassword.rx.controlEvent(.editingChanged).map({[weak self] textField in
            return self?.tfPassword.text
        })
        .withUnretained(self)
        .subscribe(onNext: {owner, text in
            owner.viewModel.tfPasswordPublisher.onNext(text ?? "")
        }).disposed(by: bag)
    }
    
    private func bindUI() {
        //MARK: - Button
        btnLogin.rx.controlEvent(.touchUpInside)
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                owner.viewModel.sigInUser(owner.tfUserName.text ?? "", password: owner.tfPassword.text ?? "", completed: { bool, text in
                    if bool {
                        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController")
                        owner.navigationController?.pushViewController(vc, animated: true)
                    }else {
                        Toast(text: text).show()
                        return
                    }
                })
            }).disposed(by: bag)
        
        btnSigUp.rx.controlEvent(.touchUpInside)
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                let vc = SigUpViewController.instance()
                owner.navigationController?.pushViewController(vc, animated: true)
            }).disposed(by: bag)
        
        btnShowPassword.rx.controlEvent(.touchUpInside)
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                owner.isShow = !owner.isShow
                if owner.isShow {
                    owner.tfPassword.isSecureTextEntry = owner.isShow
                }else {
                    owner.tfPassword.isSecureTextEntry = owner.isShow
                }
            }).disposed(by: bag)
    }
    
   
    
   
    
}

