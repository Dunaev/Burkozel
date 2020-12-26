//
//  InsetTextField.swift
//  Burkozel
//
//  Created by Sergey Dunaev on 11/10/2018.
//  Copyright © 2018 SwiftLab. All rights reserved.
//

import UIKit

class InsetTextField: UITextField {
	
	override func textRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.insetBy(dx: 16, dy: 0)
	}

	override func editingRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.insetBy(dx: 16, dy: 0)
	}
	
	override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.insetBy(dx: 16, dy: 0)
	}
	
	override func alignmentRect(forFrame frame: CGRect) -> CGRect {
		return bounds.insetBy(dx: 16, dy: 0)
	}
	
}
