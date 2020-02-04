//
//  StickNode.swift
//  swiftyProteins
//
//  Created by Maksym MATIUSHCHENKO on 2/4/20.
//  Copyright © 2020 Maksym MATIUSHCHENKO. All rights reserved.
//

import Foundation
import SceneKit

class LineNode: SCNNode
{
    init(   v1: SCNVector3,  // where line starts
            v2: SCNVector3,  // where line ends
            radius: CGFloat)     // line thicknes

    {
        super.init()
//        let  height = v1.distance(v2)
        let height = GLKVector3Distance(SCNVector3ToGLKVector3(v1), SCNVector3ToGLKVector3(v2))

        position = v1

        let ndV2 = SCNNode()

        ndV2.position = v2
//        parent.addChildNode(ndV2)

        let ndZAlign = SCNNode()
//        zAxisNode.eulerAngles.x = (Float.pi/2)

        let cylgeo = SCNCylinder(radius: radius, height: CGFloat(height))
//        cylgeo.radialSegmentCount = radSegmentCount

        let ndCylinder = SCNNode(geometry: cylgeo)
        ndCylinder.position.y = -height/2
        ndZAlign.addChildNode(ndCylinder)

        addChildNode(ndZAlign)

        constraints = [SCNLookAtConstraint(target: ndV2)]
    }

    override init() {
        super.init()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
 }
