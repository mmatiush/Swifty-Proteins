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
        let hydrogenNode4 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: methaneMolecule, position: SCNVector3Make(0, +6, 2))
        
        let lineNode = makeConnectionNode(positionStart: SCNVector3(0, 0, 0), positionEnd: SCNVector3(0, +6, 2), radius: 0.2)

        methaneMolecule.addChildNode(lineNode)
        
        
        return methaneMolecule
    }
    
    
    
    class func customMoleculeNode() -> SCNNode {
        
        let molecule = SCNNode()
        
        return molecule
        
    }
    
    
    
    class func nodeWithAtom(_ atom: SCNGeometry, molecule: SCNNode, position: SCNVector3) -> SCNNode {
        let node = SCNNode(geometry: atom)
        node.position = position
        molecule.addChildNode(node)
        return node
    }
    
    
    
}

func makeConnectionNode(positionStart: SCNVector3, positionEnd: SCNVector3, radius: CGFloat) -> SCNNode
 {
     let height = GLKVector3Distance(SCNVector3ToGLKVector3(positionStart), SCNVector3ToGLKVector3(positionEnd))
     let startNode = SCNNode()
     let endNode = SCNNode()

     startNode.position = positionStart
     endNode.position = positionEnd

     let zAxisNode = SCNNode()
    zAxisNode.eulerAngles.x = (Float.pi/2)

    let cylinderGeometry = SCNCylinder(radius: radius, height: CGFloat(height))
        cylinderGeometry.firstMaterial?.diffuse.contents = UIColor.white
     let cylinder = SCNNode(geometry: cylinderGeometry)

    cylinder.position.y = (-height/2)
     zAxisNode.addChildNode(cylinder)

     let returnNode = SCNNode()

     if (positionStart.x > 0.0 && positionStart.y < 0.0 && positionStart.z < 0.0 && positionEnd.x > 0.0 && positionEnd.y < 0.0 && positionEnd.z > 0.0)
     {
         endNode.addChildNode(zAxisNode)
         endNode.constraints = [ SCNLookAtConstraint(target: startNode) ]
         returnNode.addChildNode(endNode)

     }
     else if (positionStart.x < 0.0 && positionStart.y < 0.0 && positionStart.z < 0.0 && positionEnd.x < 0.0 && positionEnd.y < 0.0 && positionEnd.z > 0.0)
     {
         endNode.addChildNode(zAxisNode)
         endNode.constraints = [ SCNLookAtConstraint(target: startNode) ]
         returnNode.addChildNode(endNode)

     }
     else if (positionStart.x < 0.0 && positionStart.y > 0.0 && positionStart.z < 0.0 && positionEnd.x < 0.0 && positionEnd.y > 0.0 && positionEnd.z > 0.0)
     {
         endNode.addChildNode(zAxisNode)
         endNode.constraints = [ SCNLookAtConstraint(target: startNode) ]
         returnNode.addChildNode(endNode)

     }
     else if (positionStart.x > 0.0 && positionStart.y > 0.0 && positionStart.z < 0.0 && positionEnd.x > 0.0 && positionEnd.y > 0.0 && positionEnd.z > 0.0)
     {
         endNode.addChildNode(zAxisNode)
         endNode.constraints = [ SCNLookAtConstraint(target: startNode) ]
         returnNode.addChildNode(endNode)

     }
     else
     {
         startNode.addChildNode(zAxisNode)
         startNode.constraints = [ SCNLookAtConstraint(target: endNode) ]
         returnNode.addChildNode(startNode)
     }

     return returnNode
}

