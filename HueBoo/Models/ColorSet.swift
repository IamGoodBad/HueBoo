//
//  ColorSet.swift
//  HueBoo
//
//  Created by Wikipedia Brown on 9/11/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit

struct ColorSet: Equatable {
    
    let hue: CGFloat
    let saturation: CGFloat
    let brightness: CGFloat
    let alpha: CGFloat
    
    init(initialColor: UIColor) {
        var hue, saturation, brightness, alpha: CGFloat
        (hue, saturation, brightness, alpha) = (0,0,0,0)
        initialColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        self.init(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
    
    init(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat = 1) {
        self.hue = hue
        self.saturation = saturation
        self.brightness = brightness
        self.alpha = alpha
    }
    
}
