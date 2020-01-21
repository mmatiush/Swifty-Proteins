//
//  ProteinsTableViewContorller.swift
//  swiftyProteins
//
//  Created by Maksym MATIUSHCHENKO on 11/19/19.
//  Copyright © 2019 Maksym MATIUSHCHENKO. All rights reserved.
//

import UIKit

class ProteinsTableViewContorller: UIViewController {
   
    // MARK: - Properties
    private var userIsLoggedIn = false
    private var ligandsList = [String]()

    // MARK: - IBOutlets
    @IBOutlet weak var proteinsTable: UITableView!
    
    // MARK: - View LifeCycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !userIsLoggedIn {
            performSegue(withIdentifier: "segueToLoginView", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    // MARK: - IBActions
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
        userIsLoggedIn = true
    }

    @IBAction func logoutAction(_ sender: Any) {
        userIsLoggedIn = false
        performSegue(withIdentifier: "segueToLoginView", sender: self)
    }
    
    // MARK: - Methods
    
    func createLigandsListFromTextFile() {
        if let filepath = Bundle.main.path(forResource: "ligands", ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                ligandsList = contents.components(separatedBy: .newlines)
                ligandsList = ligandsList.filter({ $0 != ""})
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("Failed to load the file with ligands.")
        }
    }
    
    
    
}

extension ProteinsTableViewContorller: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}



