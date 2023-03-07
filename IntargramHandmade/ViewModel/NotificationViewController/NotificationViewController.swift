//
//  NotificationViewController.swift
//  IntargramHandmade
//
//  Created by BeeTech on 06/03/2023.
//

import UIKit

class NotificationViewController: UIViewController {
    static func instance() -> NotificationViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
        return vc
    }
    
    @IBOutlet weak var tbvSuggest: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTbvSuggest()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.navigationItem.backButtonTitle = "Thông bảo"
    }
    
    private func setupTbvSuggest() {
        tbvSuggest.delegate = self
        tbvSuggest.dataSource = self
        let nib = UINib(nibName: "SuggestTableViewCell", bundle: nil)
        tbvSuggest.register(nib, forCellReuseIdentifier: "SuggestCell")
    }
    
}

extension NotificationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbvSuggest.dequeueReusableCell(withIdentifier: "SuggestCell", for: indexPath) as! SuggestTableViewCell
        cell.backgroundColor = UIColor.yellow
        return cell
    }
    
    
}
