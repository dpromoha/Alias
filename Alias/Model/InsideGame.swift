//
//  InsideGame.swift
//  Alias
//
//  Created by Daria Pr on 23.08.2020.
//  Copyright © 2020 Daria. All rights reserved.
//

import Foundation

struct InsideGame {
    var i: Int = 0
    var progress: Float = 0.0
    var guessTouched: Int = 0
    
    mutating func answerPressed(senderTitle: String) -> Int {
        if senderTitle == "GUESS" {
            guessTouched += 1
        }
        return guessTouched
    }
    
    func getProgress(currentQuestion: Int, arr: [GameCategoryWords]) -> Float {
        return Float(currentQuestion) / Float(arr.count)
    }
    
    func getProgress(currentQuestion: Int, arr: [Item]) -> Float {
        return Float(currentQuestion) / Float(arr.count)
    }
}
