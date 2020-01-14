//
//  ProteinsTableViewContorller.swift
//  swiftyProteins
//
//  Created by Maksym MATIUSHCHENKO on 11/19/19.
//  Copyright © 2019 Maksym MATIUSHCHENKO. All rights reserved.
//

import UIKit

class ProteinsTableViewContorller: UIViewController {
    
    private var userIsLoggedIn = false
    
    // TODO - Delete
    override required init?(coder aDecoder: NSCoder) {
        print("ProteinListViewController init")
        super.init(coder: aDecoder)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ProteinsTableViewContorller viewDidAppear")
        
        if !userIsLoggedIn {
            showLoginView()
        }
    
    }
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
        print("myUnwindAction called")
        userIsLoggedIn = true
    }

    
    @IBAction func logoutAction(_ sender: Any) {
        showLoginView()
    }

    func showLoginView() {
        print("before segue")
        userIsLoggedIn = false
        performSegue(withIdentifier: "segueToLoginView", sender: self)
        print("after segue")
    }
    
    deinit {
        print("ProteinListViewController deinit")
    }
    
}




