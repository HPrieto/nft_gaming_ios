//
//  NSMutableAttributedString+Extensions.swift
//  nft_gaming
//
//  Created by Heriberto Prieto on 4/3/22.
//

import UIKit

extension NSAttributedString {
    
    public static func attributedString(_ str: String, font: UIFont? = UIFont.avenirNext(weight: .medium, size: 14), textColor: UIColor = .black) -> NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font!,
            .foregroundColor: textColor
        ]
        return NSAttributedString(string: str, attributes: attributes)
    }
}

extension NSMutableAttributedString {
    
    static func +=(lhs: NSMutableAttributedString, rhs: NSAttributedString) {
        lhs.append(rhs)
    }
    
    static func +=(lhs: NSMutableAttributedString, rhs: UIImage) {
        lhs.append(NSAttributedString(attachment: NSTextAttachment(image: rhs)))
    }
}

extension UILabel {
    
    static func +=(lhs: UILabel, rhs: NSAttributedString) {
        let attributedText = NSMutableAttributedString()
        
        if let attText = lhs.attributedText {
            attributedText.append(attText)
        }
        
        attributedText += rhs
        
        lhs.attributedText = attributedText
    }
    
    static func +=(lhs: UILabel, rhs: String) {
        let attributedText = NSMutableAttributedString()
        
        if let attText = lhs.attributedText {
            attributedText.append(attText)
        }
        
        attributedText += .attributedString(rhs)
        
        lhs.attributedText = attributedText
    }
    
    static func +=(lhs: UILabel, rhs: UIImage?) {
        guard let rhs = rhs else {
            return
        }
        let attributedText = NSMutableAttributedString()
        
        if let attText = lhs.attributedText {
            attributedText.append(attText)
        }
        
        attributedText += rhs
        
        lhs.attributedText = attributedText
    }
}
