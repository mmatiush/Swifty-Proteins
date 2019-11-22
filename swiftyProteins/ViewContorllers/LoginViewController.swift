//
//  ViewController.swift
//  swiftyProteins
//
//  Created by Maksym MATIUSHCHENKO on 11/15/19.
//  Copyright © 2019 Maksym MATIUSHCHENKO. All rights reserved.
//

import UIKit

class LoginViewController: VCLLoggingViewController {
    
    //MARK: DELETE TEMP PROPERTIES
    let tempName = "max"
    let tempPass = "123"
    
    // TODO - Delete
    override required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("LoginViewController instantiated")
    }
    
    // TODO - Delete
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("LoginViewController viewDidAppear")
    }

  
    
    // MARK: Properties
    let touchMe = BiometricIDAuth()
    let registerButtonTypeTag = 0
    let loginButtonTypeTag = 1
    
    // MARK: - IBOutlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButtonOutlet: ButtonWithBorders!
    @IBOutlet weak var createInfoLabel: UILabel!
    
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        let userAlreadyRegistered = UserDefaults.standard.bool(forKey: "hasLoginKey")
        if userAlreadyRegistered {
            loginButtonOutlet.setTitle("Login", for: .normal)
            loginButtonOutlet.tag = registerButtonTypeTag
            createInfoLabel.isHidden = true
        } else {
            loginButtonOutlet.setTitle("Create", for: .normal)
            loginButtonOutlet.tag = loginButtonTypeTag
            createInfoLabel.isHidden = false
        }
        
        if let storedUsername = UserDefaults.standard.value(forKey: "username") as? String {
            usernameTextField.text = storedUsername
        }
        
    }
    
    // MARK: - IBActions

    @IBAction func loginButtonAction(_ sender: UIButton) {
    
        guard usernameTextField.hasText,
            passwordTextField.hasText,
            let newUsername = usernameTextField.text,
            let newPassword = passwordTextField.text else {
                showLoginErrorAlert()
                return
        }
        print("I passed check")
        
        
        if sender.tag == loginButtonTypeTag {
            
            if checkLoginAndPassword(newUsername, password: newPassword) {
                print("Unwind segue is about to be performed")
                performSegue(withIdentifier: "unwindToTableView", sender: self)
            } else {
                showLoginErrorAlert()
            }
            
        } else if sender.tag == registerButtonTypeTag {
            UserDefaults.standard.set(newUsername, forKey: "username")
            // TODO: - finish registration
        }
    }
    
    
    // MARK: - Methods
    func checkLoginAndPassword(_ username: String, password: String) -> Bool {
        if username == tempName && password == tempPass {
            return true
        } else {
            return false
        }
    }
    
    func showLoginErrorAlert() {
        let alert = UIAlertController(title: "Login problem",
                                      message: "Wrong username or password.",
                                      preferredStyle: .alert)
        let alertOkAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(alertOkAction)
        present(alert, animated: true)
    }
    
}

