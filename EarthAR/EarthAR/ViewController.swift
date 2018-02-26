//
//  ViewController.swift
//  EarthAR
//
//  Created by Mateusz Chojnacki on 2/26/18.
//  Copyright © 2018 Mateusz Chojnacki. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.session.run(configuration)
    }
    
    func addNode(){
        let node = SCNNode()
        node.position = SCNVector3(0.1,0.1,0.1) // Meters
        node.geometry = SCNSphere(radius: 0.3)
        node.geometry?.firstMaterial?.diffuse.contents = UIImage(contentsOfFile: "normal")
        node.geometry?.firstMaterial?.specular.contents = UIImage(contentsOfFile: "specular")
        
        self.sceneView.automaticallyUpdatesLighting = true
        self.sceneView.scene.rootNode.addChildNode(node) 
    }



}

