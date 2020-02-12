//
//  Atom.swift
//  swiftyProteins
//
//  Created by Maksym MATIUSHCHENKO on 1/30/20.
//  Copyright © 2020 Maksym MATIUSHCHENKO. All rights reserved.
//

import Foundation
import SceneKit

class Atoms {
    
    class func atom(name: String, radius: CGFloat) -> SCNNode {

         let atom = SCNSphere(radius: radius)
         let atomNode = SCNNode(geometry: atom)

         atomNode.name = name

         return atomNode

     }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    class func carbonAtom() -> SCNGeometry {
        // 1
        let carbonAtom = SCNSphere(radius: 1.70)
        carbonAtom.firstMaterial!.diffuse.contents = UIColor.darkGray
        carbonAtom.firstMaterial!.specular.contents = UIColor.white
        return carbonAtom
    }
    
    class func hydrogenAtom() -> SCNGeometry {
      let hydrogenAtom = SCNSphere(radius: 1.20)
      hydrogenAtom.firstMaterial!.diffuse.contents = UIColor.lightGray
      hydrogenAtom.firstMaterial!.specular.contents = UIColor.white
      return hydrogenAtom
    }
      
    class func oxygenAtom() -> SCNGeometry {
      let oxygenAtom = SCNSphere(radius: 1.52)
      oxygenAtom.firstMaterial!.diffuse.contents = UIColor.red
      oxygenAtom.firstMaterial!.specular.contents = UIColor.white
      return oxygenAtom
    }
      
    class func fluorineAtom() -> SCNGeometry {
      let fluorineAtom = SCNSphere(radius: 1.47)
      fluorineAtom.firstMaterial!.diffuse.contents = UIColor.yellow
      fluorineAtom.firstMaterial!.specular.contents = UIColor.white
      return fluorineAtom
    }

    class func allAtoms() -> SCNNode {
      let atomsNode = SCNNode()
        
      let carbonNode = SCNNode(geometry: carbonAtom())
      carbonNode.position = SCNVector3Make(-6, 0, 0)
      atomsNode.addChildNode(carbonNode)
        
      let hydrogenNode = SCNNode(geometry: hydrogenAtom())
      hydrogenNode.position = SCNVector3Make(-2, 0, 0)
      atomsNode.addChildNode(hydrogenNode)
        
      let oxygenNode = SCNNode(geometry: oxygenAtom())
      oxygenNode.position = SCNVector3Make(+2, 0, 0)
      atomsNode.addChildNode(oxygenNode)
        
      let fluorineNode = SCNNode(geometry: fluorineAtom())
      fluorineNode.position = SCNVector3Make(+6, 0, 0)
      atomsNode.addChildNode(fluorineNode)
        
      return atomsNode
    }
    
}
