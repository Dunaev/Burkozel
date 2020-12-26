//
//  SettingsViewController.swift
//  Burkozel
//
//  Created by Sergey Dunaev on 02/11/2018.
//  Copyright © 2018 SwiftLab. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
	
    @IBOutlet weak var bySuitButton: ColorButton!
    @IBOutlet weak var byValueButton: ColorButton!
    
    override var prefersStatusBarHidden: Bool { return true }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	/*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
	
    @IBAction func backButtonTapped(_ sender: UIButton) {
		navigationController?.popViewController(animated: true)
    }
    
    @IBAction func bySuitTapped(_ sender: ColorButton) {
		guard !bySuitButton.isSelected else {
			return
		}
		
		byValueButton.isSelected = false
		bySuitButton.isSelected = true
    }
	
    @IBAction func byValueTapped(_ sender: ColorButton) {
		guard !byValueButton.isSelected else {
			return
		}
		
		bySuitButton.isSelected = false
		byValueButton.isSelected = true
    }
	
}
