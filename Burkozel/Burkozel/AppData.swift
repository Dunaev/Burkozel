//
//  AppData.swift
//  Burkozel
//
//  Created by Sergey Dunaev on 02/11/2018.
//  Copyright © 2018 SwiftLab. All rights reserved.
//

import Foundation

final class AppData {
	static let shared = AppData()
	private init() {}
	
	var userName: String = ""
}
