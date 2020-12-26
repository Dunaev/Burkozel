//
//  LoginViewController.swift
//  Burkozel
//
//  Created by Sergey Dunaev on 10/10/2018.
//  Copyright © 2018 SwiftLab. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

	@IBOutlet var nameTextField: InsetTextField!
	@IBOutlet var nickNameTextField: InsetTextField!
	@IBOutlet var emailTextField: InsetTextField!
	@IBOutlet var continueButton: ColorButton!
	@IBOutlet var userAgreementLabel: UILabel!
	@IBOutlet var applySwitch: UISwitch!
	@IBOutlet var yCenterConstraint: NSLayoutConstraint!
	
	let yOffsetFromCenter: CGFloat = -30.0
	
	override var prefersStatusBarHidden: Bool { return true }
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupViews()
		
		registerForKeyboardNotifications()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		nameTextField.becomeFirstResponder()
	}
	
	func setupViews() {
		let underlineAttriString = NSAttributedString(string: "Пользовательское соглашение", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
		userAgreementLabel.attributedText = underlineAttriString
		
		yCenterConstraint.constant = yOffsetFromCenter
		view.layoutIfNeeded()
		
		nameTextField.layoutIfNeeded()
		nickNameTextField.layoutIfNeeded()
		emailTextField.layoutIfNeeded()
	}
	
	// MARK: - Actions
	
	@IBAction func continueButtonPressed(_ sender: UIButton) {
		AppData.shared.userName = nameTextField.text!
		
		signIn()
	}
	
    @IBAction func didChangeSwitchState(_ sender: UISwitch) {
		continueButton.isEnabled = sender.isOn
    }
    
    @IBAction func didTapMainView(_ sender: UITapGestureRecognizer) {
		nameTextField.resignFirstResponder()
		nickNameTextField.resignFirstResponder()
		emailTextField.resignFirstResponder()
    }
	
	// MARK: - Helpers
	
	private func registerForKeyboardNotifications() {
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
	}
	
	private func signIn() {
		guard let name = nameTextField.text, !name.isEmpty else {
			showMissingNameAlert()
			return
		}
		
		nameTextField.resignFirstResponder()
		
		//AppSettings.displayName = name
		
		Auth.auth().signInAnonymously(completion: nil)
	}
	
	private func showMissingNameAlert() {
		let ac = UIAlertController(title: "Необходимо ввести имя", message: "Пожалуйста, введите имя.", preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
			DispatchQueue.main.async {
				self.nameTextField.becomeFirstResponder()
			}
		}))
		present(ac, animated: true, completion: nil)
	}
	
	// MARK: - Notifications
	
	@objc private func keyboardWillShow(_ notification: Notification) {
		guard let userInfo = notification.userInfo else {
			return
		}
		guard let keyboardHeight = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height else {
			return
		}
		guard let keyboardAnimationDuration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue else {
			return
		}
		guard let keyboardAnimationCurve = (userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber)?.uintValue else {
			return
		}
		
		let options = UIView.AnimationOptions(rawValue: keyboardAnimationCurve << 16)
		yCenterConstraint.constant = -(keyboardHeight / 2 + 20 - yOffsetFromCenter)
		
		UIView.animate(withDuration: keyboardAnimationDuration, delay: 0, options: options, animations: {
			self.view.layoutIfNeeded()
		}, completion: nil)
	}
	
	@objc private func keyboardWillHide(_ notification: Notification) {
		guard let userInfo = notification.userInfo else {
			return
		}
		guard let keyboardAnimationDuration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue else {
			return
		}
		guard let keyboardAnimationCurve = (userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber)?.uintValue else {
			return
		}
		
		let options = UIView.AnimationOptions(rawValue: keyboardAnimationCurve << 16)
		yCenterConstraint.constant = yOffsetFromCenter
		
		UIView.animate(withDuration: keyboardAnimationDuration, delay: 0, options: options, animations: {
			self.view.layoutIfNeeded()
		}, completion: nil)
	}

}
