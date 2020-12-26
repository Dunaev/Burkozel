//
//  ColorButton.swift
//  Burkozel
//
//  Created by Sergey Dunaev on 08/02/2019.
//  Copyright © 2019 SwiftLab. All rights reserved.
//

import UIKit

class ColorButton: UIButton {

	@IBInspectable var imageColor: String = "" {
		didSet {
			configureBackground()
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		setTitleShadowColor(UIColor(white: 0, alpha: 0.25), for: .normal)
		setTitleShadowColor(UIColor(white: 0, alpha: 0.25), for: .selected)
		layer.shadowOffset = CGSize(width: 0, height: -2)
		
		tintColor = UIColor.clear
		setTitleColor(UIColor.white, for: .normal)
		setTitleColor(UIColor.white, for: .selected)
		
		backgroundColor = UIColor.clear
		
		configureBackground()
		
		if let _ = image(for: .normal) {
			titleEdgeInsets = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0)
			imageEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
		}
		
	}
	
	fileprivate func configureBackground() {
		setBackgroundImage(UIImage(named: "\(imageColor)_button_active"), for: .normal)
		setBackgroundImage(UIImage(named: "\(imageColor)_button_inactive"), for: .selected)
	}
	
}
