//
//  ButtonDesign.swift
//  Alias
//
//  Created by Daria Pr on 20.08.2020.
//  Copyright © 2020 Daria. All rights reserved.
//

import UIKit

class ButtonDesign: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = layer.frame.size.height / 3
    }

}
