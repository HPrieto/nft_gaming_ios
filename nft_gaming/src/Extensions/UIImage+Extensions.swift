//
//  UIImage+Extensions.swift
//  marketa
//
//  Created by Heriberto Prieto on 2/4/22.
//

import UIKit

fileprivate let imageCache = NSCache<NSString, UIImage>()

extension UIImage {
    
    public static var verifiedLogo: UIImage {
        UIImage(named: "verifiedLogo")!
    }
    
}

extension UIImageView {
    
    public func fetchImage(urlString: String) {
        
        var image: UIImage?
        
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            image = cachedImage
        } else if let url = URL(string: urlString),
                    let data = try? Data(contentsOf: url),
                    let newImage = UIImage(data: data) {
            imageCache.setObject(newImage, forKey: urlString as NSString)
            image = newImage
        }
        
        self.image = image
    }
}
