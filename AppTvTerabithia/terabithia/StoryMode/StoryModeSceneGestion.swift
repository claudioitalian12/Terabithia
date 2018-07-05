//
//  StoryModeSceneGestion.swift
//  terabithia
//
//  Created by Claudio Cavalli on 01/03/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//


import UIKit
import SpriteKit
import GameplayKit

class StoryModeSceneGestion: SKScene {
   
    public static let instance = StoryModeSceneGestion()
    var object = GeneratorObject()
    override func sceneDidLoad() {
 
    }
    
    override func didMove(to view: SKView) {
       // addBG()
        object.AnimationBackgroundArray.removeAll()
        object.AnimationCharacters.removeAll()
        object.characters.removeAll()
        object.characterselected.removeAll()
        object.compositioname = ""
        object.positionx = -380
    }
    
    func printer(){
        print("dfwefewfhef ewjfhe wdwedw")
        addBG()
    }
    func skscene()-> SKScene {
        print(StoryModeSceneGestion.instance.scene!)
        let x = StoryModeSceneGestion.instance.scene!
        return x
    }
    func addBG(){
        
  //      let background = SKSpriteNode(imageNamed: "BackgroundDefault")
  //      background.position = CGPoint(x: 0, y: 0)
        
  ////      background.size.width = self.size.width
   //     background.size.height = self.size.height
   //     background.anchorPoint = CGPoint(x: 0.5,y: 0.5)
   //     background.zPosition = -11
   //     addChild(background)
      

    }
    
    func addObjecttoTheScreen(names: String){
        object.generator(singleton: StoryModeSceneGestion.instance, width: self.size.width, height: self.size.height, name: names)
      
    
    }
   
}
