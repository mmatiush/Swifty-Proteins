//
//  Molecules.swift
//  swiftyProteins
//
//  Created by Maksym MATIUSHCHENKO on 1/30/20.
//  Copyright © 2020 Maksym MATIUSHCHENKO. All rights reserved.
//

import Foundation
import SceneKit

class Molecules {
    
    class func methaneMolecule() -> SCNNode {
        let methaneMolecule = SCNNode()
        
        // 1 Carbon
        let carbonNode1 = nodeWithAtom(Atoms.carbonAtom(), molecule: methaneMolecule, position: SCNVector3Make(0, 0, 0))
        
        // 4 Hydrogen
        let hydrogenNode1 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: methaneMolecule, position: SCNVector3Make(-4, 0, 0))
        let hydrogenNode2 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: methaneMolecule, position: SCNVector3Make(+4, 0, 0))
        let hydrogenNode3 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: methaneMolecule, position: SCNVector3Make(0, -4, 0))
        let hydrogenNode4 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: methaneMolecule, position: SCNVector3Make(0, +4, 0))
        
        
        return methaneMolecule
    }
    
    class func ethanolMolecule() -> SCNNode {
        let ethanolMolecule = SCNNode()
        return ethanolMolecule
    }
    
    class func ptfeMolecule() -> SCNNode {
        let ptfeMolecule = SCNNode()
        return ptfeMolecule
    }
    
    class func nodeWithAtom(_ atom: SCNGeometry, molecule: SCNNode, position: SCNVector3) -> SCNNode {
        let node = SCNNode(geometry: atom)
        node.position = position
        molecule.addChildNode(node)
        return node
    }
    
    
    
}
