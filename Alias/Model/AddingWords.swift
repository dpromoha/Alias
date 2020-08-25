//
//  AddingWords.swift
//  Alias
//
//  Created by Daria Pr on 23.08.2020.
//  Copyright © 2020 Daria. All rights reserved.
//

import Foundation

struct AddingWords {
    func checkWhitespaces(str: String) -> Bool {
        var detectWhitespace: Int = 0

        for i in str {
            if i.isWhitespace {
                detectWhitespace += 1
            }
        }
        return detectWhitespace != str.count ? true : false
    }
    
}
