//
//  FantasyModeViewController.swift
//  terabithia
//
//  Created by Claudio Cavalli on 07/03/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVKit

class FantasyModeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        FantasyModeSpriteKit.instance.removeAllActions()
        FantasyModeSpriteKit.instance.removeAllChildren()
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            
            
            // Set the scale mode to scale to fit the window
            
            
            FantasyModeSpriteKit.instance.anchorPoint = (SKScene(fileNamed: "FantasyModeScene")?.anchorPoint)!
            FantasyModeSpriteKit.instance.size.width = (SKScene(fileNamed: "FantasyModeScene")?.frame.width)!
            FantasyModeSpriteKit.instance.size.height = (SKScene(fileNamed: "FantasyModeScene")?.frame.height)!
            // <SKScene> name:'(null)' frame:{{-0, -0}, {1, 1}} anchor:{0, 0}
            // <SKScene> name:'(null)' frame:{{-375, -667}, {750, 1334}}
            // Present the scene
            let scene = FantasyModeSpriteKit.instance.scene
            scene?.scaleMode = .aspectFill
            view.presentScene(scene)
      
            
            //      StoryModeSceneGestion.instance.addBG()
            view.ignoresSiblingOrder = true
            view.showsFPS = false
            view.showsPhysics = false
            view.showsNodeCount = false
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
