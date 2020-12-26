//
//  ShadowedView.swift
//  Argus
//
//  Created by Sergey Dunaev on 27/08/2018.
//  Copyright © 2018 Sergey Dunaev. All rights reserved.
//

import UIKit

class ShadowedView: UIView {

    @IBInspectable var shadowColor: UIColor = UIColor.black {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 2, height: 1) {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    @IBInspectable var shadowOpacity: Float = 0.3 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    @IBInspectable var shadowRadius: CGFloat = 10 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 20 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
