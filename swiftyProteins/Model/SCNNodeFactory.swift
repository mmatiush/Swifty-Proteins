//
//  SCNNodeFactory.swift
//  swiftyProteins
//
//  Created by Maksym MATIUSHCHENKO on 2/12/20.
//  Copyright © 2020 Maksym MATIUSHCHENKO. All rights reserved.
//

import Foundation
import SceneKit

class SCNNodeFactory {
    
    class func atom(name: String) -> SCNNode {
        
        
        var radius = AtomSpecs.radius[name]
        let color = AtomSpecs.color[name]
        
        if radius != nil {
            radius = radius!/3
        }
        
        let atomGeometry = SCNSphere(radius: radius ?? 0.4)

        atomGeometry.firstMaterial?.diffuse.contents = color ?? UIColor.purple

        let atomNode = SCNNode(geometry: atomGeometry)
        
        atomNode.name = name
        
        return atomNode
        
    }
    
    class func connection(positionStart: SCNVector3, positionEnd: SCNVector3, radius: CGFloat) -> SCNNode
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
    
    
}
