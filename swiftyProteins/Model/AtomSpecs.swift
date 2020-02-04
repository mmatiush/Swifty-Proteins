//
//  AtomSpecs.swift
//  swiftyProteins
//
//  Created by Maksym MATIUSHCHENKO on 2/4/20.
//  Copyright © 2020 Maksym MATIUSHCHENKO. All rights reserved.
//

import Foundation
import UIKit

struct AtomSpecs {
    static let colors: [String : UIColor] = [
        "H" : UIColor.white,
        "C" : UIColor.black,
        "N" : UIColor(red: 0/255, green: 0/255, blue: 128/255, alpha: 1),
        "O" : UIColor.red,
        "F" : UIColor.green,
        "CL" : UIColor.green,
        "BR" : UIColor(red: 139/255, green: 69/255, blue: 19/255, alpha: 1),
        "I" : UIColor(red: 75/255, green: 0/255, blue: 130/255, alpha: 1),
        "NE" : UIColor.cyan,
        "HE" : UIColor.cyan,
        "AR" : UIColor.cyan,
        "XE" : UIColor.cyan,
        "KR" : UIColor.cyan,
        "P" : UIColor.orange,
        "S" : UIColor.yellow,
        "B" : UIColor(red: 255/255, green: 160/255, blue: 122/255, alpha: 1),
        "LI" : UIColor(red: 138/255, green: 43/255, blue: 226/255, alpha: 1),
        "NA" : UIColor(red: 138/255, green: 43/255, blue: 226/255, alpha: 1),
        "K" : UIColor(red: 138/255, green: 43/255, blue: 226/255, alpha: 1),
        "RB" : UIColor(red: 138/255, green: 43/255, blue: 226/255, alpha: 1),
        "CS" : UIColor(red: 138/255, green: 43/255, blue: 226/255, alpha: 1),
        "FR" : UIColor(red: 138/255, green: 43/255, blue: 226/255, alpha: 1),
        "BE" : UIColor(red: 0/255, green: 100/255, blue: 0/255, alpha: 1),
        "MG" : UIColor(red: 0/255, green: 100/255, blue: 0/255, alpha: 1),
        "CA" : UIColor(red: 0/255, green: 100/255, blue: 0/255, alpha: 1),
        "SR" : UIColor(red: 0/255, green: 100/255, blue: 0/255, alpha: 1),
        "BA" : UIColor(red: 0/255, green: 100/255, blue: 0/255, alpha: 1),
        "RA" : UIColor(red: 0/255, green: 100/255, blue: 0/255, alpha: 1),
        "TI" : UIColor.gray,
        "FE" : UIColor(red: 255/255, green: 140/255, blue: 0/255, alpha: 1),
        "default" : UIColor.purple
    ]
    
    static let radius: [String : Float] = [
        "N"     : 1.55,
        "O"     : 1.52,
        "F"     : 1.47,
        "Ne"    : 1.54,
        "Na"    : 2.27,
        "Mg"    : 1.73,
        "Si"    : 2.10,
        "P"     : 1.80,
        "S"     : 1.80,
        "Cl"    : 1.75,
        "Ar"    : 1.88,
        "K"     : 2.75,
        "Ni"    : 1.63,
        "Cu"    : 1.40,
        "Zn"    : 1.39,
        "Ga"    : 1.87,
        "As"    : 1.85,
        "Se"    : 1.90,
        "Br"    : 1.85,
        "Kr"    : 2.02,
        "Pd"    : 1.63,
        "Ag"    : 1.72,
        "Cd"    : 1.58,
        "In"    : 1.93,
        "Sn"    : 2.17,
        "Te"    : 2.06,
        "I"     : 1.98,
        "Xe"    : 2.16,
        "Pt"    : 1.75,
        "Au"    : 1.66,
        "Hg"    : 1.55,
        "Tl"    : 1.96,
        "Pb"    : 2.02,
        "U"     : 1.86,
        "default": 1.5
    ]
}
