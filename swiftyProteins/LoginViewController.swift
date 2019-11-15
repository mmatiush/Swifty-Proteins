//
//  ViewController.swift
//  swiftyProteins
//
//  Created by Maksym MATIUSHCHENKO on 11/15/19.
//  Copyright © 2019 Maksym MATIUSHCHENKO. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Properties
    let touchMe = BiometricIDAuth()

    
    // MARK: - IBOutlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButtonOutlet: ButtonWithBorders!
    @IBOutlet weak var createInfoLabel: UILabel!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        let userAlreadyRegistered = UserDefaults.standard.bool(forKey: "hasLoginKey")
        if userAlreadyRegistered {
            loginButtonOutlet.setTitle("Login", for: .normal)
            createInfoLabel.isHidden = true
        } else {
            loginButtonOutlet.setTitle("Create", for: .normal)
            createInfoLabel.isHidden = false
        }
        
        if let storedUsername = UserDefaults.standard.value(forKey: "username") as? String {
            usernameTextField.text = storedUsername
        }
        
    }

    // MARK: - IBActions

    
    
    // MARK: - Methods


}

