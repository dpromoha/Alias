//
//  ButtonPlayDesign.swift
//  Alias
//
//  Created by Daria Pr on 20.08.2020.
//  Copyright © 2020 Daria. All rights reserved.
//

import UIKit

class ButtonPlayDesign: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = layer.frame.size.height / 3
        layer.borderWidth = 2.0
        layer.borderColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
    }

}
