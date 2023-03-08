//
//  NewsTableViewCell.swift
//  IntargramHandmade
//
//  Created by BeeTech on 07/03/2023.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
   // @IBOutlet weak var postNewsCollection: UICollectionView!
    
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var imgAvt: UIImageView!
    
    @IBOutlet weak var imgPlut: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        setupPostCollection()
//        self.postNewsCollection.dataSource = self
//        self.postNewsCollection.delegate = self
        // Initialization code
        setupCircle()
    }
    
    private func setupCircle() {
        circleView.layer.cornerRadius = circleView.frame.height / 2
        circleView.layer.masksToBounds = true
        
        imgPlut.layer.cornerRadius = imgPlut.frame.height / 2
        imgPlut.layer.masksToBounds = true
        imgPlut.layer.borderWidth = 2
        imgPlut.layer.borderColor = UIColor.white.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
//    func reloadCollectionView() {
//        self.postNewsCollection.reloadData()
//    }
//
//    private func setupPostCollection() {
//        postNewsCollection.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: "PostNews")
//    }
    
}

//extension NewsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = postNewsCollection.dequeueReusableCell(withReuseIdentifier: "PostNews", for: indexPath) as! PostCollectionViewCell
//        cell.setupSubView()
//        cell.backgroundColor = UIColor.yellow
//        postNewsCollection.reloadData()
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 100, height: 100)
//    }
//
//
//
    
//}
