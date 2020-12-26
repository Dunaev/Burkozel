//
//  MainViewController.swift
//  Burkozel
//
//  Created by Sergey Dunaev on 04/10/2018.
//  Copyright © 2018 Sergey Dunaev. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {
	
    @IBOutlet weak var userPhotoImageView: PhotoView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var friendsButton: ColorButton!
    @IBOutlet weak var tournirsButton: ColorButton!
    @IBOutlet weak var achievmentsButton: ColorButton!
    @IBOutlet weak var settingsButton: ColorButton!
    @IBOutlet weak var shareButton: ColorButton!
    @IBOutlet weak var rulesButton: ColorButton!
	
	override var prefersStatusBarHidden: Bool { return true }
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureView()
	}
	
	func configureView() {
		userNameLabel.text = AppData.shared.userName
	}
	
    // MARK: - Actions
    @IBAction func friendsButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func tournirsButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func achievmentsButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func settingsButtonTapped(_ sender: UIButton) {
		performSegue(withIdentifier: "ShowSettings", sender: nil)
    }
    
    @IBAction func shareButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func rulesButtonTapped(_ sender: UIButton) {
		try? Auth.auth().signOut()
    }
}
