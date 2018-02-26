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
        self.addNode()
    }
    
    func addNode(){
        let earthNode = SCNNode()
        earthNode.position = SCNVector3(0.1,0.1,0.1) // Meters
        earthNode.geometry = SCNSphere(radius: 0.3)
        earthNode.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "earth_daymap")
        earthNode.geometry?.firstMaterial?.specular.contents = #imageLiteral(resourceName: "earth_specular_map")
        
        self.sceneView.automaticallyUpdatesLighting = true
        self.sceneView.scene.rootNode.addChildNode(earthNode)
        
        
        let moonNode = SCNNode()
        moonNode.position = SCNVector3(0,0,1) // Meters
        moonNode.geometry = SCNSphere(radius: 0.2)
        moonNode.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "moon")
        
        earthNode.addChildNode(moonNode)
        
        let rotateAction = SCNAction.rotateBy(x: 0,
                                              y: CGFloat(Double.pi * 2),
                                              z: 0,
                                              duration: 10)
        earthNode.runAction(SCNAction.repeatForever(rotateAction))
        
        
    }



}

