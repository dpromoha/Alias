//
//  FinishVC.swift
//  Alias
//
//  Created by Daria Pr on 20.08.2020.
//  Copyright © 2020 Daria. All rights reserved.
//

import UIKit

class FinishVC: UIViewController {

    @IBOutlet weak var scoreLbl: UILabel!
    var resultLbl: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton

        scoreLbl.text = String("\(resultLbl)/10")
    }
    
    func initProgress(score: Int) {
        resultLbl = score
    }
    

}
