//
//  TabBarController.swift
//  Burkozel
//
//  Created by Sergey Dunaev on 11/10/2018.
//  Copyright © 2018 SwiftLab. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

	override var prefersStatusBarHidden: Bool { return true }
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		//tabBar.backgroundImage = UIImage(named: "tabbar_background")
		tabBar.backgroundColor = UIColor(red: 24 / 255, green: 22 / 255, blue: 28 / 255, alpha: 1.0)
		tabBar.barTintColor = UIColor(red: 41 / 255, green: 121 / 255, blue: 255 / 255, alpha: 1.0)
		tabBar.tintColor = UIColor(red: 41 / 255, green: 121 / 255, blue: 255 / 255, alpha: 1.0)
		tabBar.unselectedItemTintColor = UIColor(white: 140 / 255, alpha: 1.0)
    }

}
