//
//  ExploreViewController.swift
//  IntargramHandmade
//
//  Created by BeeTech on 06/03/2023.
//

import UIKit

class ExploreViewController: UIViewController {
    static func instance() -> ExploreViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExploreViewController") as! ExploreViewController
        return vc
    }
    
    @IBOutlet weak var tbvNews: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTbvNew()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.navigationItem.setHidesBackButton(true, animated: false)
        navigationController?.setNavigationBarHidden(false, animated: false)
        let heartButton = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(didTapHeart(_:)))
        heartButton.tintColor = .black
        let planetButton = UIBarButtonItem(image: UIImage(systemName: "paperplane"), style: .plain, target: self, action: #selector(didTapPlane(_:)))
        planetButton.tintColor = .black
        tabBarController?.navigationItem.rightBarButtonItems = [planetButton,heartButton]
        let leftButton = UIBarButtonItem(title: "Instargram ", style: .plain, target: self, action: #selector(didTapTitle(_:)))
        leftButton.tintColor = .black
        tabBarController?.navigationItem.leftBarButtonItem = leftButton
        
    }
    
    private func setupTbvNew() {
        tbvNews.delegate = self
        tbvNews.dataSource = self
        let nib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        tbvNews.register(nib, forCellReuseIdentifier: "NewsTableCell")
        
    }
    

    @objc func didTapHeart(_ sender: UIButton) {
        let vc = NotificationViewController.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTapPlane(_ sender: UIButton) {
        
    }
    
    @objc func didTapTitle(_ sender: UIButton) {
        print("vuongdv Tap Tap")
    }
}
extension ExploreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbvNews.dequeueReusableCell(withIdentifier: "NewsTableCell", for: indexPath) as! NewsTableViewCell
        
        cell.backgroundColor = UIColor.yellow
        return cell
    }
}
