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
//    private var hydrogenIsHidden = false
//    private let ligandFileContent = String()
    var ligandName = ""
    var atomsArray : [SCNNode] = []
    var conectionsArray : [SCNNode] = []
    
    @IBAction func hideHydrogen(_ sender: UIBarButtonItem) {
//        sceneView.scene!.rootNode.isHidden = !sceneView.scene!.rootNode.isHidden
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        cameraAndLightSetup()
        
        NetworkService.downloadLigandFile(ligandName: ligandName) { (ligandFie) in
            
            guard let ligand = ligandFie else { return }
            
            let ligandFileSplitByLines = ligand.split(separator: "\n")
            
            for line in ligandFileSplitByLines {
                let splitString = line.split(separator: " ")
                if splitString[0] == "ATOM" {
                    self.addAtom(splitString)
                } else if splitString[0] == "CONECT" {
                    self.addConnection(splitString)
                }
            }
        }
    }
    
    private func addAtom(_ splitString: Array<Substring>) {
        
        if splitString.count != 12 {
            print("ATOM in ligand file has a wrong format")
            return
        }
        
        let x = Float(splitString[6])
        let y = Float(splitString[7])
        let z = Float(splitString[8])
        let name = String(splitString[11])
        
        let atomNode = SCNNodeFactory.atom(name: name)
        atomNode.position = SCNVector3Make(x!, y!, z!)
        sceneView.scene?.rootNode.addChildNode(atomNode)
        atomsArray.append(atomNode)
        
    }
    
    private func addConnection(_ splitString: Array<Substring>) {
        if splitString.count < 3 {
            print("CONNECT in ligand file has a wrong format")
        }
        
        // To match node index of the atom in atomsArray with atom serial number from lignad file we duct 1
        let atomIndex = Int(splitString[1])! - 1
        let connectStartPoint = atomsArray[atomIndex].position
        
        for i in 2..<splitString.count {
            let secondAtomIndex = Int(splitString[i])! - 1
            // Connect the atom only to atoms that have smaller index to avoid creating the same connection several times
            if atomIndex <= secondAtomIndex { break }
            let connectEndPoint = atomsArray[secondAtomIndex].position
            let connect = SCNNodeFactory.connection(positionStart: connectStartPoint, positionEnd: connectEndPoint, radius: 0.2)
            
            sceneView.scene?.rootNode.addChildNode(connect)
            conectionsArray.append(connect)
        }
    }
    
    
    // MARK: Scene
    func cameraAndLightSetup() {
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
        
        sceneView.allowsCameraControl = true
        sceneView.scene = scene
        
    }
    
}
