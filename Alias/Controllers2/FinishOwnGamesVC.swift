//
//  FinishOwnGamesVC.swift
//  Alias
//
//  Created by Daria Pr on 21.08.2020.
//  Copyright © 2020 Daria. All rights reserved.
//

import UIKit

class FinishOwnGamesVC: UIViewController {

    @IBOutlet weak var scoreLbl: UILabel!
    
    var resultLbl: Int = 0
    var sumElementsOfArray: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton

        scoreLbl.text = String("\(resultLbl) / \(sumElementsOfArray)")
    }
    
    func initProgress(score: Int, countArray: Int) {
        resultLbl = score
        sumElementsOfArray = countArray
    }
}
