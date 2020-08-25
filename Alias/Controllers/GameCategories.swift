//
//  GameCategories.swift
//  Alias
//
//  Created by Daria Pr on 19.08.2020.
//  Copyright © 2020 Daria. All rights reserved.
//

import UIKit

class GameCategories: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var word: UILabel!
    
    private(set) public var gameWords = [GameCategoryWords]()
    var i: Int = 0
    var guessTouched: Int = 0
    var rulesGame = InsideGame()

    override func viewDidLoad() {
        super.viewDidLoad()

        word.text = gameWords[i].title
        progressBar.progress = 0.0
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        guessTouched = rulesGame.answerPressed(senderTitle: sender.currentTitle ?? "0")
        
        i+=1
        progressBar.progress = rulesGame.getProgress(currentQuestion: i, arr: gameWords)

        if i >= gameWords.count {
            performSegue(withIdentifier: "finishVC", sender: self)
        } else {
            word.text = gameWords[i].title
        }
    }
    
}

extension GameCategories {
    func initCategories(category: Category) {
        gameWords = ReusableCategory.instance.getGameCategoryWords(forCategoryTitle: category.title)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? FinishVC {
            destinationVC.initProgress(score: guessTouched)
        }
    }
}
