//
//  CommentViewController.swift
//  IntargramHandmade
//
//  Created by mr.root on 3/8/23.
//

import UIKit

class CommentViewController: UIViewController {
    
    static func instance() -> CommentViewController {
        let vc = UIStoryboard(name: "CommentViewController", bundle: nil) as! CommentViewController
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
