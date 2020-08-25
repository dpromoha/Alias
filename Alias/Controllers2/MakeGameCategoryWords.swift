//
//  MakeGameCategoryWords.swift
//  Alias
//
//  Created by Daria Pr on 21.08.2020.
//  Copyright © 2020 Daria. All rights reserved.
//

import UIKit

class MakeGameCategoryWords: UIViewController {
    
    @IBOutlet weak var wordsLbl: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    private(set) public var ownGameWords = [Item]()
    var i: Int = 0
    var progress: Float = 0.0
    var guessTouched: Int = 0
    var insideGame = InsideGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        wordsLbl.text = ownGameWords[i].title
        progressBar.progress = 0.0
        
    }

    @IBAction func answerWasPressed(_ sender: UIButton) {
        guessTouched = insideGame.answerPressed(senderTitle: sender.currentTitle ?? "0")
        
        i+=1
        progressBar.progress = insideGame.getProgress(currentQuestion: i, arr: ownGameWords)

        if i >= ownGameWords.count {
            performSegue(withIdentifier: "FinishOwnGamesVC", sender: self)
        } else {
            wordsLbl.text = ownGameWords[i].title
        }
    }
}

extension MakeGameCategoryWords {
    func initOwnWords(wordsArray: [Item]) {
        ownGameWords = wordsArray
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if let destinationVC = segue.destination as? FinishOwnGamesVC {
               destinationVC.initProgress(score: guessTouched, countArray: ownGameWords.count)
           }
       }
}
