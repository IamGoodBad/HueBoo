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
    
    var colorScheme: ColorScheme?
    
    init(initialColor: UIColor) {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 1
        initialColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        self.hue = hue
        self.saturation = saturation
        self.brightness = brightness
        self.alpha = alpha
    }
    
    init(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat = 1) {
        self.hue = hue
        self.saturation = saturation
        self.brightness = brightness
        self.alpha = alpha
    }
    
    func getColorScheme() -> [ColorSet] {
        guard let colorScheme = colorScheme else { return [] }
        switch colorScheme {
        case .monochromatic:
            return getMonochromaticScheme()
        }
    }
    
    private func getMonochromaticScheme() -> [ColorSet] {
        let colorOne = self
        let colorTwo = ColorSet(hue: hue, saturation: getSaturation(0.2), brightness: brightness)
        let colorThree = ColorSet(hue: hue, saturation: getSaturation(0.4), brightness: brightness)
        let colorFour = ColorSet(hue: hue, saturation: saturation, brightness: getSaturation(0.2))
        let colorFive = ColorSet(hue: hue, saturation: saturation, brightness: getSaturation(0.4))
        return [colorOne, colorTwo, colorThree, colorFour, colorFive]
    }
    
    private func getHue(_ offset: CGFloat) -> CGFloat {
        return (hue + offset).truncatingRemainder(dividingBy: 1.1)
    }
    
    private func getSaturation(_ offset: CGFloat) -> CGFloat {
        return (saturation + offset).truncatingRemainder(dividingBy: 1.1)
    }
    
    private func getBrightness(_ offset: CGFloat) -> CGFloat {
        return (brightness + offset).truncatingRemainder(dividingBy: 1.1)
    }
    
    private func getAlpha(_ offset: CGFloat) -> CGFloat {
        return (alpha + offset).truncatingRemainder(dividingBy: 1.1)
    }
    
}
