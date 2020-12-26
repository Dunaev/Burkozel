//
//  AppController.swift
//  Burkozel
//
//  Created by Sergey Dunaev on 10/10/2018.
//  Copyright © 2018 SwiftLab. All rights reserved.
//

import UIKit
import Firebase

final class AppController {
	
	static let shared = AppController()
	
	private init() {
		NotificationCenter.default.addObserver(self, selector: #selector(userStateDidChange),
											   name: Notification.Name.AuthStateDidChange, object: nil)
	}
	
	private var window: UIWindow!
	private var rootViewController: UIViewController? {
		didSet {
			if let vc = rootViewController {
				window.rootViewController = vc
			}
		}
	}
	
	// MARK: - Helpers
	
	func show(in window: UIWindow?) {
		guard let window = window else {
			fatalError("Cannot layout app with a nil window.")
		}
		
		FirebaseApp.configure()
		
		self.window = window
		//window.tintColor = .primary
		//window.backgroundColor = .white
		
		handleAppState()
		
		window.makeKeyAndVisible()
	}
	
	private func handleAppState() {
		if let _ = Auth.auth().currentUser {
			let storyboard = UIStoryboard(name: "Main", bundle: nil)
			let tabBarC = storyboard.instantiateViewController(withIdentifier: "TabBarController")
			rootViewController = tabBarC
		} else {
			rootViewController = LoginViewController()
		}
	}
	
	// MARK: - Notifications
	
	@objc internal func userStateDidChange() {
		DispatchQueue.main.async {
			self.handleAppState()
		}
	}
	
}
