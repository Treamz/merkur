//
//  MySceneView.swift
//  Merkur
//
//  Created by Ivan Chernoknizhikov on 04.12.2024.
//

import SceneKit
import SwiftUI

struct MySceneView: UIViewRepresentable {
    typealias UIViewType = SCNView
    typealias Context = UIViewRepresentableContext<MySceneView>
    
    var modelName: String
    var rotate: Bool = false
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    func makeUIView(context: Context) -> UIViewType {
        let view = SCNView()
        view.backgroundColor = UIColor.clear // this is key!
        view.allowsCameraControl = true
        view.autoenablesDefaultLighting = true
        // load the object here, could load a .scn file too
        // Load the scene based on the model name
        if let scene = SCNScene(named: modelName) {
            view.scene = scene
            if(rotate == true) {
                rotatePlanets(in: scene, duration: 30)
            }
        } else {
            print("Failed to load scene with name: \(modelName)")
        }
        
        return view
    }
    private func rotatePlanets(in scene: SCNScene, duration: TimeInterval) {
          // Loop through all nodes in the scene to find planet nodes
          for node in scene.rootNode.childNodes {
              if node.name?.lowercased().contains("planet") == true {
                  // Apply the rotation to the planet node
                  let rotation = SCNAction.rotateBy(x: 0, y: CGFloat.pi * 2, z: 0, duration: duration)
                  node.runAction(SCNAction.repeatForever(rotation))
              }
          }
      }
}
