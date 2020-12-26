//
//  UIView+Additions.swift
//  Burkozel
//
//  Created by Sergey Dunaev on 10/10/2018.
//  Copyright © 2018 SwiftLab. All rights reserved.
//

import UIKit

extension UIView {
	
	func smoothRoundCorners(to radius: CGFloat) {
		let maskLayer = CAShapeLayer()
		maskLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
		
		layer.mask = maskLayer
	}
	
}
