//
//  LigandVisualisationViewController.swift
//  swiftyProteins
//
//  Created by Maksym MATIUSHCHENKO on 1/28/20.
//  Copyright © 2020 Maksym MATIUSHCHENKO. All rights reserved.
//

import UIKit

class LigandVisualisationViewController: UIViewController {
    
    var ligand = String()
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = ligand
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
