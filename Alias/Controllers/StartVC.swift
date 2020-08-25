//
//  StartVC.swift
//  Alias
//
//  Created by Daria Pr on 18.08.2020.
//  Copyright © 2020 Daria. All rights reserved.
//

import UIKit
import CLTypingLabel

class StartVC: UIViewController {

    @IBOutlet weak var appName: CLTypingLabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        appName.charInterval = 0.2
        appName.text = "ALIAS"
        
        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
    }

}

