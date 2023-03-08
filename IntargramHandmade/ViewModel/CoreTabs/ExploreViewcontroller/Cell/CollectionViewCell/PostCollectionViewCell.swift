//
//  PostCollectionViewCell.swift
//  IntargramHandmade
//
//  Created by BeeTech on 07/03/2023.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var circelView: UIView!
    @IBOutlet weak var lbtext: UILabel!
    @IBOutlet weak var imgPlust: UIImageView!
    
    static var indentifier = "PostCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "PostCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code        
    }

    func setupSubView() {
        circelView?.layer.cornerRadius = circelView.frame.height / 2
        circelView?.layer.masksToBounds = true
        imgPlust?.layer.cornerRadius = imgPlust.frame.height / 2
        imgPlust?.layer.masksToBounds = true
        imgPlust?.layer.borderWidth = 2
        imgPlust?.layer.borderColor = UIColor.white.cgColor
    }
    
    func bindData(_ tesxt: String) {
        lbtext?.text = tesxt
    }

}
