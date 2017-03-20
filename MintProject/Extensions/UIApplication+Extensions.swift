//
//  UIApplication+Extensions.swift
//  MintProject
//
//  Created by Penpitcha Natisupalak on 3/20/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import UIKit

extension UIApplication {
    
    var screenShot: UIImage?  {
        
        if let layer = keyWindow?.layer {
            let scale = UIScreen.main.scale
            UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
            if let context = UIGraphicsGetCurrentContext() {
                layer.render(in: context)
                let screenshot = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                return screenshot
            }
        }
        return nil
    }
}
