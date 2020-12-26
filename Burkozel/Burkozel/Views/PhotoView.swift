//
//  PhotoView.swift
//  Burkozel
//
//  Created by Sergey Dunaev on 11/02/2019.
//  Copyright © 2019 SwiftLab. All rights reserved.
//

import UIKit

class PhotoView: UIImageView {
	
	private var shadowView = UIView()
	private var frameIamge = UIImageView()
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		let ratio = frame.width / 100
		
		layer.cornerRadius = 10 * ratio
		clipsToBounds = true
		
		setupShadowLayer()
		
		if let image = UIImage(named: "avatar_frame") {
			frameIamge.image = image
		}
		
		addSubview(frameIamge)
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		shadowView.frame = frame
		frameIamge.frame = bounds
	}
	
	func setupShadowLayer() {
		let ratio = frame.width / 100
		
		let shapeLayer = CAShapeLayer()
		shapeLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 10 * ratio).cgPath
		shadowView.layer.addSublayer(shapeLayer)
		
		shadowView.layer.shadowColor = UIColor.black.cgColor
		shadowView.layer.shadowOffset = CGSize(width: 0, height: 4 * ratio)
		shadowView.layer.shadowOpacity = 0.2
		shadowView.layer.shadowRadius = 2 * ratio
		
		superview?.insertSubview(shadowView, belowSubview: self)
	}

}
