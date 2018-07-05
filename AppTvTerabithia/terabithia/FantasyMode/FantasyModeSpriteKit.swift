//
//  FantasyModeSpriteKit.swift
//  terabithia
//
//  Created by Claudio Cavalli on 07/03/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//

import SpriteKit
import GameplayKit
import MultipeerConnectivity

class FantasyModeSpriteKit: SKScene, MultiPeerDelegate, SKPhysicsContactDelegate {
    
    public static let instance = FantasyModeSpriteKit()
    
    var generatorObject = GeneratorObjects()
    var Multipeerconn = MultiPeer()
    func multiPeer(didReceiveData data: Data) {
        
        if  let text = try! (NSKeyedUnarchiver.unarchiveObject(with: data) as? String){
              if(temp != String(text.dropLast())){
      generatorObject.generator(singleton: FantasyModeSpriteKit.instance, width: self.size.width, height: self.size.height, name: text.dropLast().lowercased())
              // addObjecttoTheScreen(names: text.dropLast().lowercased())
            }
            temp = String(text.dropLast())
        }
            
    }
    
    
    
    func multiPeer(connectedDevicesChanged devices: [String]) {
        
    }
    
    override func sceneDidLoad() {
      
        generatorObject.AnimationBackgroundArray.removeAll()
        generatorObject.AnimationBackgroundArray.removeAll()
        generatorObject.characters.removeAll()
        generatorObject.characterselected.removeAll()
        generatorObject.compositioname.removeAll()
        generatorObject.positionx = -380
        //manipulatorText.instance.defaultSet(stringa: "")
       // i = 0
        temp2 = 0
        temp = ""
        
    }
    
    override func didMove(to view: SKView) {
        
        Multipeerconn.initialize(serviceType: "Terabithia", deviceName: "host")
        Multipeerconn.startAccepting()
        Multipeerconn.delegate = self
        
        
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)

        
        
        
    //    let background = SKSpriteNode(imageNamed: "BackgroundDefault")
     //   background.position = CGPoint(x: 0, y: 0)
        
     //   background.size.width = self.size.width
     //   background.size.height = self.size.height
      //  background.anchorPoint = CGPoint(x: 0.5,y: 0.5)
     //   background.zPosition = -11
     //   addChild(background)
        
        
    }
    
}
