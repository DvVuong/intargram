//
//  ExploreCell.swift
//  IntargramHandmade
//
//  Created by BeeTech on 08/03/2023.
//

import UIKit
import RxSwift
import RxCocoa

class ExploreCell: UITableViewCell {
    @IBOutlet weak var avtUser: UIImageView!
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var btnMore: UIButton!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btnHeart: UIButton!
    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var btnSend: UIButton!
    
    @IBOutlet weak var btnBookmark: UIButton!
    var actionBtnHeart: (() -> Void)?
    var actionBtMore: (() -> Void)?
    var actionCmmt: (() -> Void)?
    var actionSend: (() -> Void)?
    var actionBookmark: (() -> Void)?
    var bag = DisposeBag()
    override func awakeFromNib() {
        super.awakeFromNib()
        setupButton()
        setupAvt()
        actioncButton()
    }
    
    private func setupButton() {
        btnMore.setTitle("", for: .normal)
        btnHeart.setTitle("", for: .normal)
        btnComment.setTitle("", for: .normal)
        btnSend.setTitle("", for: .normal)
        btnBookmark.setTitle("", for: .normal)
        
    }
    
    private func setupAvt() {
        avtUser.layer.cornerRadius = avtUser.frame.height / 2
        avtUser.layer.masksToBounds = true
    }
    
    private func actioncButton() {
        btnHeart.rx.controlEvent(.touchUpInside)
            .withUnretained(self)
            .subscribe(onNext: {owner, _ in
                owner.actionBtnHeart?()
            }).disposed(by: bag)
        
        btnMore.rx.controlEvent(.touchUpInside)
            .withUnretained(self)
            .subscribe(onNext: {owner, _ in
                owner.actionBtMore?()
            }).disposed(by: bag)
        
        btnSend.rx.controlEvent(.touchUpInside)
            .withUnretained(self)
            .subscribe(onNext: {owner, _ in
                owner.actionSend?()
            }).disposed(by: bag)
        
        btnComment.rx.controlEvent(.touchUpInside)
            .withUnretained(self)
            .subscribe(onNext: {owner, _ in
                owner.actionCmmt?()
            }).disposed(by: bag)
        
        btnBookmark.rx.controlEvent(.touchUpInside)
            .withUnretained(self)
            .subscribe(onNext: {owner, _ in
                owner.actionBookmark?()
            }).disposed(by: bag)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
