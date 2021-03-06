
import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.sceneView = ARSCNView(frame: self.view.frame)
        self.view.addSubview(self.sceneView)
        
        
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene()
        
        // Textを作る⬇︎
        let textGeometry = SCNText(string: "! ios Techers Thankyou !", extrusionDepth: 0.5)
        textGeometry.firstMaterial?.diffuse.contents = UIColor.systemPink
        
        let textNode = SCNNode(geometry: textGeometry)
        textNode.position = SCNVector3(-0.7, 0.2, -3)
        textNode.scale = SCNVector3(0.01, 0.01, 0.01)
        
        scene.rootNode.addChildNode(textNode)
        

    

        // 球体を作る⬇︎
        let sphere = SCNSphere(radius: 0.2)
        let sphereMaterial = SCNMaterial()
        //sphereMaterial.diffuse.contents = UIColor.green
        sphereMaterial.diffuse.contents = UIImage(named: "hiyoko.png")
        
        let node = SCNNode()
        let sphereNode = SCNNode()
        sphereNode.geometry = sphere
        sphereNode.geometry?.materials = [sphereMaterial]
        sphereNode.position = SCNVector3(0, -0.2, -1)
        
        scene.rootNode.addChildNode(node)
        scene.rootNode.addChildNode(sphereNode)
        
        
        
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}

/* BOXの表示
 let box = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
       let material = SCNMaterial()
       material.diffuse.contents = UIColor.systemPink
       let node = SCNNode()
       node.geometry = box
       node.geometry?.materials = [material]
       node.position = SCNVector3(0, 0.2, -0.5)
       scene.rootNode.addChildNode(node)*/


/* テキストの表示
 let textGeometry = SCNText(string: "Hello Swift", extrusionDepth: 1.0)
 textGeometry.firstMaterial?.diffuse.contents = UIColor.orange
 
 let textNode = SCNNode(geometry: textGeometry)
 textNode.position = SCNVector3(0,0.1,-0.6)
 textNode.scale = SCNVector3(0.02, 0.02, 0.02)
 
 scene.rootNode.addChildNode(textNode)*/
