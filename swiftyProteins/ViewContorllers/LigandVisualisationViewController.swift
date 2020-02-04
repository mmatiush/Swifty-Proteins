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
    private var hydrogenIsHidden = false
    
    
    @IBAction func hideHydrogen(_ sender: UIBarButtonItem) {
      
        sceneView.scene!.rootNode.isHidden = !sceneView.scene!.rootNode.isHidden
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        cameraAndLightSetup()
        
    }
    
    // MARK: Scene
    func cameraAndLightSetup() {
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
  
        let methaneMoleculeNode = Molecules.methaneMolecule()
        scene.rootNode.addChildNode(methaneMoleculeNode)
        
        // 2,5
        
        
        // 3
        sceneView.allowsCameraControl = true
        sceneView.scene = scene
        
    }
    
}
