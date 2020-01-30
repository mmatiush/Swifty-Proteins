//
//  LigandVisualisationViewController.swift
//  swiftyProteins
//
//  Created by Maksym MATIUSHCHENKO on 1/28/20.
//  Copyright © 2020 Maksym MATIUSHCHENKO. All rights reserved.
//

import UIKit
import SceneKit

class LigandVisualisationViewController: UIViewController {
    
    @IBOutlet weak var sceneView: SCNView!
    
    // Geometry
    var geometryNode: SCNNode = SCNNode()
    
    // Gestures
    var currentAngle: Float = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        sceneSetup()
        
        //        let geometryNode = Atoms.allAtoms()
        //        sceneView.scene!.rootNode.addChildNode(geometryNode)
        
    }
    
    // MARK: Scene
    func sceneSetup() {
        // 1
        let scene = SCNScene()
        
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLight.LightType.ambient
        ambientLightNode.light!.color = UIColor(white: 0.67, alpha: 1.0)
        scene.rootNode.addChildNode(ambientLightNode)
        
        let omniLightNode = SCNNode()
        omniLightNode.light = SCNLight()
        omniLightNode.light!.type = SCNLight.LightType.omni
        omniLightNode.light!.color = UIColor(white: 0.75, alpha: 1.0)
        omniLightNode.position = SCNVector3Make(0, 50, 50)
        scene.rootNode.addChildNode(omniLightNode)
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 0, 25)
        scene.rootNode.addChildNode(cameraNode)
        
        
        
        // 2
        //        let boxGeometry = SCNBox(width: 10.0, height: 10.0, length: 10.0, chamferRadius: 1.0)
        //        let boxNode = SCNNode(geometry: boxGeometry)
        
        
        //        let allAtomsNode = Atoms.allAtoms()
        let methaneMoleculeNode = Molecules.methaneMolecule()
        
        //        scene.rootNode.addChildNode(boxNode)
        scene.rootNode.addChildNode(methaneMoleculeNode)
        
        
        // 3
        
        //        geometryNode = boxNode
        //        geometryNode = allAtomsNode
        
        
        //        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
        //        sceneView.addGestureRecognizer(panRecognizer)
        
        
        sceneView.allowsCameraControl = true
        sceneView.scene = scene
        
    }
    
    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: sender.view!)
        var newAngle = (Float)(translation.x)*(Float)(Float.pi)/180.0
        newAngle += currentAngle
        
        geometryNode.transform = SCNMatrix4MakeRotation(newAngle, 0, 1, 0)
        
        if(sender.state == UIGestureRecognizer.State.ended) {
            currentAngle = newAngle
        }
    }
    
}
