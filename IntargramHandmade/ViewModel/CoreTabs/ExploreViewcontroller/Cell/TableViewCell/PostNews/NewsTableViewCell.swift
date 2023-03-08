//
//  NewsTableViewCell.swift
//  IntargramHandmade
//
//  Created by BeeTech on 07/03/2023.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
   @IBOutlet weak var postNewsCollection: UICollectionView!
    
    func config(_ models: [Model]) {
        self.models = models
    }
    
    var models = [Model]()
    
    func reloadCollectionView() {
        self.postNewsCollection.reloadData()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupPostCollection()
        self.postNewsCollection?.dataSource = self
        self.postNewsCollection?.delegate = self
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private func setupPostCollection() {
        postNewsCollection.register(PostCollectionViewCell.nib(), forCellWithReuseIdentifier: PostCollectionViewCell.indentifier)
    }
    
}

extension NewsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = postNewsCollection.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.indentifier, for: indexPath) as! PostCollectionViewCell
        cell.setupSubView()
        //cell.bindData(models[indexPath.row].text)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 120)
    }
}
