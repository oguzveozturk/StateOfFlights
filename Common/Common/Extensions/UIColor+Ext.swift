//
//  UIColor+Ext.swift
//  Common
//
//  Created by Oğuz Öztürk on 9.06.2023.
//

import UIKit

public extension UIColor {
    static func icao24ToColor(_ icao24Code: String) -> UIColor? {
        let chars: [Character: Int] = ["a": 0, "b": 1, "c": 2, "d": 3, "e": 4, "f": 5]
        let hueValue = icao24Code.reduce(0) { result, character in
            let digitValue = Int(String(character)) ?? chars[character] ?? 0
            return result * 10 + digitValue
        }
        let hue = CGFloat(hueValue % 360) / 360.0
        let color = UIColor(hue: hue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        
        return color
    }
}
