//
//  ViewController.swift
//  MintProject
//
//  Created by Penpitcha Natisupalak on 3/20/2560 BE.
//  Copyright © 2560 Penpitcha Natisupalak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var visualEffectButton: UIButton!
    @IBOutlet weak var snapEffectButton: UIButton!
    
    var isTapped: Bool = false
    
    let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.regular))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        blurEffectView.frame = self.overlayView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.overlayView.addSubview(blurEffectView)
        blurEffectView.alpha = 0
        imageView.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func snapEffectTouch(_ sender: Any) {
        if !isTapped {
            snapEffectButton.isHidden = true
            let screenshot = UIApplication.shared.screenShot!
            snapEffectButton.isHidden = false
            
            let blurScreenshot = screenshot.applyBlurWithRadius(6.0, tintColor: UIColor.clear, saturationDeltaFactor: 1.0)
            imageView.image = blurScreenshot
            UIView.animate(withDuration: 0.25, animations: {
                self.imageView.alpha = 1.0
            })
        }
        else {
            UIView.animate(withDuration: 0.25, animations: {
                self.imageView.alpha = 0.0
            }, completion: {(finished: Bool) in
                self.bgImageView.image = UIImage(named: "landscape_0")
            })
        }
        isTapped = !isTapped
    }

    @IBAction func buttonTouch(_ sender: Any) {
        if !isTapped {
            blur()
        }
        else {
            unblur()
        }
        isTapped = !isTapped
    }

    func blur() {
        UIView.animate(withDuration: 0.25, animations: {
            self.blurEffectView.alpha = 1
        }, completion: nil)
    }
    
    func unblur() {
        UIView.animate(withDuration: 0.25, animations: {
            self.blurEffectView.alpha = 0
        }, completion: nil)
    }
}

