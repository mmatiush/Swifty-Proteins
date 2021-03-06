//
//  ProteinsTableViewContorller.swift
//  swiftyProteins
//
//  Created by Maksym MATIUSHCHENKO on 11/19/19.
//  Copyright © 2019 Maksym MATIUSHCHENKO. All rights reserved.
//

import UIKit

class ProteinsTableViewContorller: UITableViewController {
   
    // MARK: - Properties
    private var userIsLoggedIn = false
    private var ligandsList = [String]()
    private var filteredLigands = [String]()
    private let searchController = UISearchController(searchResultsController: nil)
    private var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    private var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    
    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !userIsLoggedIn {
            performSegue(withIdentifier: "segueToLoginView", sender: self)
        }
        ligandsList = createLigandsListFromTextFile()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
                
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      if let indexPath = tableView.indexPathForSelectedRow {
        tableView.deselectRow(at: indexPath, animated: true)
      }
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
    private func createLigandsListFromTextFile() -> [String] {
        
        var list = [String]()
        
        if let filepath = Bundle.main.path(forResource: "ligands", ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                list = contents.components(separatedBy: .newlines)
                if list.last == "" {
                    list.removeLast()
                }
                return list
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("Failed to load the file with ligands.")
        }
        return list
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "segueToLigandVisualisationVC",
            let indexPath = tableView.indexPathForSelectedRow,
            let detailViewController = segue.destination as? LigandVisualisationViewController
            else { return }
        
        var ligand: String
        if isFiltering {
            ligand = filteredLigands[indexPath.row]
        } else {
            ligand = ligandsList[indexPath.row]
        }

        detailViewController.ligandName = ligand
        
    }
    
}

    // MARK: - Extensions
extension ProteinsTableViewContorller {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredLigands.count
        }
        return ligandsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "proteinCell", for: indexPath)
        
        if isFiltering {
            cell.textLabel?.text = filteredLigands[indexPath.row]
        } else {
            cell.textLabel?.text = ligandsList[indexPath.row]
        }
        
        return cell
        
    }
}

extension ProteinsTableViewContorller: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredLigands = ligandsList.filter { (ligand: String) -> Bool in
        return ligand.lowercased().contains(searchText.lowercased())
      }
      
      tableView.reloadData()
    }
    
}


