//
//  UIFont+Extensions.swift
//  nft_gaming
//
//  Created by Heriberto Prieto on 3/27/22.
//

import UIKit

extension UIFont {
    
    public static func avenirNext(weight: Weight, size: CGFloat) -> UIFont? {
        let fontName: String
        
        switch weight {
        case .light: fontName = "AvenirNext-UltraLight"
        case .heavy: fontName = "AvenirNext-Heavy"
        case .medium: fontName = "AvenirNext-Medium"
        case .bold: fontName = "AvenirNext-Bold"
        case .regular: fontName = "AvenirNext-Regular"
        case .semibold: fontName = "AvenirNext-DemiBold"
        case .black: fontName = "AvenirNext-Black"
        case .ultraLight: fontName = "AvenirNext-UltraLight"
        default: fontName = "AvenirNext-Regular"
        }
        
        return UIFont(name: fontName, size: size)
    }
    
}

/**
 
 
 case .light: fontName = "AvenirNext-UltraLight"
 case .heavy: fontName = "AvenirNext-Heavy"
 case .medium: fontName = "AvenirNext-Medium"
 case .bold: fontName = "AvenirNext-Bold"
 case .regular: fontName = "AvenirNext-Regular"
 case .semibold: fontName = "AvenirNext-DemiBold"
 case .black: fontName = "AvenirNext-Black"
 case .ultraLight: fontName = "AvenirNext-UltraLight"
 default: fontName = "AvenirNext-Regular"
 
 */
