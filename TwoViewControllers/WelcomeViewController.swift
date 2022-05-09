//
//  WelcomeViewController.swift
//  TwoViewControllers
//
//  Created by Петрова Яна Георгиевна on 03.05.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var welcome = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = welcome
    }
}
