//
//  NavigationController.swift
//  Burkozel
//
//  Created by Sergey Dunaev on 10/10/2018.
//  Copyright © 2018 SwiftLab. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
	
	override var prefersStatusBarHidden: Bool { return true }
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = UIColor(red: 24 / 255, green: 22 / 255, blue: 28 / 255, alpha: 1.0)
	}
	
}

/*
extension NavigationController: UINavigationBarDelegate {
	
	func position(for bar: UIBarPositioning) -> UIBarPosition {
		return .topAttached
	}
	
}
*/
