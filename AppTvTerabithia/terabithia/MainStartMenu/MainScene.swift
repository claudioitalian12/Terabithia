//
//  GameScene.swift
//  terabithia
//
//  Created by Claudio Cavalli on 27/02/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
   var ground = SKSpriteNode()
   // var ground1 = SKSpriteNode()
    override func sceneDidLoad() {
        
       
    }
    
    override func didMove(to view: SKView) {
       
     
            
        
          
            self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                self.createGrounds()
        
    
      
        
       
    }
    
    override func update(_ currentTime: TimeInterval) {
       moveGrounds()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touche in touches {
            let location = touche.location(in: self)
            
            if atPoint(location).name == "start" {}
            
        }}
    
    func createGrounds(){
        
        for i in 0...3{
            let ground = SKSpriteNode(imageNamed: "ground")
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        ground.name = "Ground"
            ground.zPosition = 3
        ground.size = CGSize(width: ((self.scene?.size.width))!, height: 500)
        ground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        ground.position = CGPoint(x: CGFloat(i) * ground.size.width , y:  -40)
        self.addChild(ground)
        }
        
    }
    
    func moveGrounds(){
        self.enumerateChildNodes(withName: "Ground") { (node, error) in
            node.position.x -= 3.5
            
            if node.position.x < -((self.scene?.size.width))!{
                node.position.x += (self.scene?.size.width)! * 3
            }
        }
    }
    

}

