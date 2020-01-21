//
//  ViewController.swift
//  swiftyProteins
//
//  Created by Maksym MATIUSHCHENKO on 11/15/19.
//  Copyright © 2019 Maksym MATIUSHCHENKO. All rights reserved.
//

import UIKit
import Locksmith

class LoginViewController: UIViewController {
    
    // MARK: Properties
    private let userAccount = "swiftyCompanionAcc"
    private let biometricAuth = BiometricIDAuth()
    private let registerButtonTypeTag = 0
    private let loginButtonTypeTag = 1
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButtonOutlet: ButtonWithBorders!
    @IBOutlet weak var createInfoLabel: UILabel!
    @IBOutlet weak var biometricAuthOutlet: UIButton!
    
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        let userAlreadyRegistered = UserDefaults.standard.bool(forKey: "hasLoginKey")
        
        // Customize
        if userAlreadyRegistered {
            loginButtonOutlet.setTitle("Login", for: .normal)
            loginButtonOutlet.tag = loginButtonTypeTag
            createInfoLabel.isHidden = true
            biometricAuthOutlet.isHidden = false
        } else {
            loginButtonOutlet.setTitle("Register", for: .normal)
            loginButtonOutlet.tag = registerButtonTypeTag
            createInfoLabel.isHidden = false
            biometricAuthOutlet.isHidden = true
        }
        
        if let storedUsername = UserDefaults.standard.value(forKey: "username") as? String {
            usernameTextField.text = storedUsername
        }
        
        switch biometricAuth.biometryType() {
        case .none:
            biometricAuthOutlet.isHidden = true
        case .faceID:
            biometricAuthOutlet.setImage(UIImage(named: "FaceIcon"), for: .normal)
        case .touchID:
            biometricAuthOutlet.setImage(UIImage(named: "Touch-icon-lg"), for: .normal)
        @unknown default:
            fatalError()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - IBActions

    @IBAction func loginButtonAction(_ sender: UIButton) {
    
        // Check if login and pass fields are empty
        guard usernameTextField.hasText,
            passwordTextField.hasText,
            let newUsername = usernameTextField.text,
            let newPassword = passwordTextField.text else {
                showLoginFailedAlert()
                return
        }
        
        if sender.tag == loginButtonTypeTag {
            
            if checkLoginAndPassword(newUsername, password: newPassword) {
                print("Unwind segue is about to be performed")
                performSegue(withIdentifier: "unwindToProteinsList", sender: self)
            } else {
                showLoginFailedAlert()
            }
            
        } else if sender.tag == registerButtonTypeTag {
            
            // Save password of the new account in KeyChain
            do {
                try Locksmith.updateData(data: ["password": newPassword], forUserAccount: self.userAccount)
                print("New password has been added to KeyChain")
            } catch let error {
                print("Unable to save password to KeyChain. ", error.localizedDescription)
                showLoginFailedAlert()
            }
            
            // Save username in defaults
            UserDefaults.standard.set(newUsername, forKey: "username")
            UserDefaults.standard.set(true, forKey: "hasLoginKey")
            
            performSegue(withIdentifier: "unwindToProteinsList", sender: self)
        }
    }
    
    @IBAction func touchIDLoginAction(_ sender: UIButton) {
        
        // Check if the entered username is the same as saved username
        guard let username = UserDefaults.standard.value(forKey: "username") as? String,
            username == usernameTextField.text else {
                showLoginFailedAlert()
                return
        }
        
        biometricAuth.authenticateUser { [weak self] message in
            if let message = message {
                let alert = UIAlertController(title: "Error",
                                               message: message,
                                               preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alert.addAction(action)
                self?.present(alert, animated: true)
            } else {
                print("Biometric authentication was successful")
                self?.performSegue(withIdentifier: "unwindToProteinsList", sender: self)

            }
        }
        
    }
    
    // MARK: - Methods
    func checkLoginAndPassword(_ username: String, password: String) -> Bool {
        
        if let storedUsername = UserDefaults.standard.value(forKey: "username") as? String,
            storedUsername == username,
            let dict = Locksmith.loadDataForUserAccount(userAccount: "swiftyCompanionAcc"),
            dict["password"] as? String == password {
            return true
        } else {
            return false
        }
    }
    
    func showLoginFailedAlert() {
        let alert = UIAlertController(title: "Login problem",
                                      message: "Wrong username or password.",
                                      preferredStyle: .alert)
        let alertOkAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(alertOkAction)
        present(alert, animated: true)
    }
    
    deinit {
        print("LoginViewController deinit")
    }
    
}

