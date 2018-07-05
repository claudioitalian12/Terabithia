//
//  GameViewController.swift
//  terabithia
//
//  Created by Claudio Cavalli on 27/02/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVKit
class GameViewController: UIViewController {
   var player: AVAudioPlayer?
    let listgif = ["skeleton-x4","bat-x4","ghost-x4","frog-x4"]
    
    @IBOutlet weak var skeleton: UIImageView!
    
    @IBOutlet weak var bat: UIImageView!
 
    
    @IBOutlet weak var ghost: UIImageView!
    
    @IBOutlet weak var slime: UIImageView!
    
    @IBOutlet weak var castoro: UIImageView!
    
  
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
  
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            view.showsFPS = false
            view.showsPhysics = false
            view.showsNodeCount = false
        }
        DispatchQueue.main.async {
          
            self.castoro.loadGif(name: "castoro")
            
            self.skeleton.loadGif(name: self.listgif[Int(arc4random_uniform(4))])
            self.bat.loadGif(name: self.listgif[Int(arc4random_uniform(4))])
            self.ghost.loadGif(name: self.listgif[Int(arc4random_uniform(4))])
            self.slime.loadGif(name: self.listgif[Int(arc4random_uniform(4))])
            MusicManager.shared.setup(ResouceName: "intro", ExtensionType: "wav")
            MusicManager.shared.play()
            
        }
        
        
        
    
      
    }

    @IBAction func StoryMode(_ sender: Any) {
      MusicManager.shared.stop()
    }
    
    
    @IBAction func FantasyMode(_ sender: Any) {
      MusicManager.shared.stop()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    
}
