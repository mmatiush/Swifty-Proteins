//
//  BiometricIDAuth.swift
//  swiftyProteins
//
//  Created by Maksym MATIUSHCHENKO on 12/17/19.
//  Copyright © 2019 Maksym MATIUSHCHENKO. All rights reserved.
//

import Foundation
import LocalAuthentication

class BiometricIDAuth {
    
    private let context = LAContext()
    private let loginReason = "Logging with Touch ID"
    
    func canEvaluatePolicy() -> Bool {
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
    }
    
    func biometryType() -> LABiometryType {
        _ = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        return context.biometryType
    }

    func authenticateUser(completion: @escaping (String?) -> Void) {
        guard canEvaluatePolicy() else {
            completion("Biometric authentication is not available")
            return
        }
        
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: loginReason) { (success, evaluateError) in
           
            DispatchQueue.main.async {
                if success {
                    completion(nil)
                } else {
                    
                    let message: String
                    
                    switch evaluateError {
                    case LAError.authenticationFailed?:
                        message = "There was a problem verifying your identity."
                    case LAError.userCancel?:
                        message = "You cancelled authentication."
                    case LAError.userFallback?:
                        message = "You pressed password."
                    case LAError.biometryNotAvailable?:
                        message = "Face ID/Touch ID is not available."
                    case LAError.biometryNotEnrolled?:
                        message = "Face ID/Touch ID is not set up."
                    case LAError.biometryLockout?:
                        message = "Face ID/Touch ID is locked."
                    default:
                        message = "Face ID/Touch ID may not be configured"
                    }
                    completion(message)
                    
                }
            }
        }
        
    }
    
    
}

