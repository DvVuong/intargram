//
//  PostCollectionViewCell.swift
//  IntargramHandmade
//
//  Created by BeeTech on 07/03/2023.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var avtUser: UIImageView!
    @IBOutlet weak var lbText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code        
    }

    func setupSubView() {
        subView?.layer.cornerRadius = subView.frame.height / 2
        subView?.layer.masksToBounds = true
    }

}
