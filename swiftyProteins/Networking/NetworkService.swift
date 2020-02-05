//
//  NetworkService.swift
//  swiftyProteins
//
//  Created by Maksym MATIUSHCHENKO on 2/5/20.
//  Copyright © 2020 Maksym MATIUSHCHENKO. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService {
    
    static func downloadLigandFile(ligandName: String, completionHandler: @escaping (String?) -> Void ) {
        
        let URL = "https://files.rcsb.org/ligands/view/\(ligandName)_ideal.pdb"
        print(URL)
        
        Alamofire.request(URL).validate().responseString { (response) in
            switch response.result {
            case .success(let fileText):
                completionHandler(fileText)
            case .failure(let error):
                print(error.localizedDescription)
                debugPrint(response.result)
                debugPrint(response.error)
            }
        }
    }
}
