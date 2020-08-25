//
//  Category.swift
//  Alias
//
//  Created by Daria Pr on 19.08.2020.
//  Copyright © 2020 Daria. All rights reserved.
//

import Foundation

struct Category {
    private(set) public var title: String
    private(set) public var imageName: String

    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}
