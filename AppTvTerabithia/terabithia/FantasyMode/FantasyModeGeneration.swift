//
//  FantasyModeGeneration.swift
//  terabithia
//
//  Created by Claudio Cavalli on 08/03/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//

import UIKit
import SpriteKit

public class GeneratorObjects: SKScene{

    static public let instance = GeneratorObjects()
    var objectbackground = SKSpriteNode()
    var characters = [SKSpriteNode]()
    var characterselected = [String]()
    var AnimationCharacters = [[SKTexture]]()
    var AnimationBackgroundArray = [SKTexture]()
    var compositioname = String()
    var positionx = -380
    func generator(singleton: FantasyModeSpriteKit,width: CGFloat,height: CGFloat, name: String){
        
        
        
        //    object.append(SKSpriteNode(imageNamed: "apple-0"))
        
        //   background.size.width =
        //   background.size.height =
        
        //    var altezza = height/2
        //    object[0].position = CGPoint(x: 0, y: (altezza/(-3)))
        
        
        //  background.anchorPoint = CGPoint(x: 0.5,y: 0.5)
        
        //  object[0].zPosition = +20
        //   singleton.addChild(object[0])
        // sleep(1)
        var temp = name
        var name = name + "-0"
       
         
        if(temp == "lotta"){lotta()}
        print(temp)
        let fileimgb = Bundle.main.url(forResource: name, withExtension: "png", subdirectory:"Background")
        if (fileimgb != nil){
            generatebackground(singleton: singleton,name: temp)
        }
        
        let fileimgc = Bundle.main.url(forResource: name, withExtension: "png", subdirectory:"Character1")
        if (fileimgc != nil){
            generateCharacters(singleton: singleton,name: temp, heigth: height)
        }
        /*
         switch(temp){
         case "uomo": do {
         print("okk")
         characters.append(SKSpriteNode(imageNamed: "uomo"))
         characters.last?.position =   CGPoint(x: 0, y: 0)
         }
         case "donna": do {characters.append(SKSpriteNode(imageNamed: "donna"))
         characters.last?.position =  CGPoint(x: Int(arc4random_uniform(UInt32(singleton.size.width/2))) - Int(arc4random_uniform(UInt32(singleton.size.width/4))), y: 0)
         }
         case "soldato": do {characters.append(SKSpriteNode(imageNamed: "soldato"))
         characters.last?.position =  CGPoint(x: Int(arc4random_uniform(UInt32(singleton.size.width/2))) - Int(arc4random_uniform(UInt32(singleton.size.width/4))), y: 0)
         }
         default: do {}
         }
         */
    }
    
    func generatebackground(singleton: FantasyModeSpriteKit, name: String){
        
        deletebackground(singleton: singleton)
        if(name == "room") {//MusicManager.shared.setup(ResouceName: "MenuSelectSound", ExtensionType: "wav")
           // MusicManager.shared.play()
        }
        
        objectbackground = SKSpriteNode(imageNamed: name+"-0")
        
        objectbackground.position = CGPoint(x: 0, y: 0)
        objectbackground.size.width  = singleton.size.width
        objectbackground.size.height = singleton.size.height
        objectbackground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        objectbackground.zPosition = -10
        
        singleton.addChild(objectbackground)
        var i = 0
        while(true){
            print(name + "-" + String(i))
            let fileimg = Bundle.main.url(forResource: name + "-" + String(i), withExtension: "png", subdirectory:"Background")
            if (fileimg == nil){
                break
            }
            AnimationBackgroundArray.append(SKTexture(imageNamed: name + "-" + String(i)))
            print(name + "-" + String(i))
            i = i + 1
            
        }
        
        objectbackground.run(SKAction.repeatForever(SKAction.animate(with: AnimationBackgroundArray, timePerFrame: 0.1)))
        
    }
    
    func deletebackground(singleton: FantasyModeSpriteKit){
        // sleep(3)
        objectbackground.removeAllActions()
        AnimationBackgroundArray.removeAll()
        //   singleton.removeChildren(in: [objectbackground])
        singleton.removeAllChildren()
        MusicManager.shared.stop()
        
        characterselected.removeAll()
        positionx = -380
    }
    
    func generateCharacters(singleton: FantasyModeSpriteKit, name: String, heigth: CGFloat){

        if(characterselected.count < 3){
            if(characterselected.contains(name) == false ){
                characterselected.append(name)
                characters.append(SKSpriteNode(imageNamed: name + "-0"))
                //     characters.last?.physicsBody?.affectedByGravity = false
                //  characters.last?.position = CGPoint(x: 0 , y: 0)
                //characters.last?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            //    characters.last?.size.width = 340
            //    characters.last?.size.height = 500
                // characters.last?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            //    if(name == "nonna"){
             //       characters.last?.zPosition = -8
                  //  characters.last?.size.width = 340
                  //  characters.last?.size.height = 500
                    
            //    }
              //  if(name == "cappuccetto" || name == "cacciatore"){
              //      characters.last?.size.width = 400
                 //   characters.last?.size.height = 600
            //    }
                //    characters.last?.xScale = 0.9
                //    characters.last?.yScale = 0.9
            //    if( name == "lupo"){
               //     characters.last?.size.width = 450
              //      characters.last?.size.height = 680
            //    }
                
            
                
//                    if(name == "rabbit"){
//                 characters.last?.zPosition = -8
              //   characters.last?.xScale = 0.6
              //   characters.last?.yScale = 0.6
                 
//                 }
                
//                   if(name == "tesla"){
//                 characters.last?.zPosition = -8
             //    characters.last?.xScale = 0.6
              //   characters.last?.yScale = 0.6
                 
//                 }
            
      
            
//                characters.last?.size.width = 290
//                characters.last?.size.height = 500
   
                characters.last?.aspectFillToSize(fillSize: (characters.last?.size)!)
                 characters.last?.position = CGPoint(x: positionx , y: -100)
                if(name == "tesla") {characters.last?.position = CGPoint(x: positionx , y: 0) }
                positionx = positionx + 450
//                if(name == "tesla"){
//                    characters.last?.size.width = 560
//                    characters.last?.size.height = 700
//                   characters.last?.position = CGPoint(x: -100, y: 0)
                   // characters.last?.position =
//                }
              if(name == "malata"){
                  //  characters.last?.zPosition = -8
                characters.last?.size.width = 600
                characters.last?.size.height = 740
                //    characters.last?.position = CGPoint(x: positionx , y: -100)
            //    positionx = positionx + 300
                   // positionx = positionx
                }
                if(name == "mamma"){
                    characters.last?.zPosition = -8
                 
                //    characters.last?.size.width = 340
                 //   characters.last?.size.height = 500
                 //   characters.last?.position = CGPoint(x: positionx , y: -100)
             //       positionx = positionx + 300
                    // positionx = positionx
     // characters.last?.position = CGPoint(x: positionx , y: -100)
                }
                if(name == "cappuccetto" || name == "cacciatore"){
                    characters.last?.size.width = 600
                    characters.last?.size.height = 740
                //   characters.last?.position = CGPoint(x: positionx , y: -100)
                 //   positionx = positionx
             //       positionx = positionx + 300
                   
                }
                //    characters.last?.xScale = 0.9
                //    characters.last?.yScale = 0.9
                if( name == "lupo"){
                    characters.last?.size.width = 450
                    characters.last?.size.height = 680
                //    characters.last?.position = CGPoint(x: positionx , y: -100)
                 //
                  //  positionx = positionx
             //       positionx = positionx + 300
      //              characters.last?.position = CGPoint(x: positionx , y: -100)
                }
                
                if( name == "nonnina"){
                    characters.last?.size.width = 600
                    characters.last?.size.height = 740
                }
                singleton.addChild((characters.last)!)
                
                var i = 0
                var temp = [SKTexture]()
                while(true){
                 //   print(name + "-" + String(i))
                    let fileimg = Bundle.main.url(forResource: name + "-" + String(i), withExtension: "png", subdirectory:"Character1")
                    if (fileimg == nil){
                        break
                    }
                    
                    temp.append(SKTexture(imageNamed: name + "-" + String(i)))
                    print(name + "-" + String(i))
                    i = i + 1
                    
                }
                AnimationCharacters.append(temp)
            //    print(AnimationCharacters.count)
                
            }
            
        }
        else { //positionx = -330
            // characterselected.removeAll()
        }
        
    }
    
    
    func lotta(){


        for i in 0..<characters.count{
            DispatchQueue.main.async {
                self.characters[i].run(SKAction.repeatForever(SKAction.animate(with: self.AnimationCharacters[i], timePerFrame: 0.1)))
                
            }
            
        }
        
    }
    
    func inizial(){
        
    }
}

extension SKSpriteNode {
    
    func aspectFillToSize(fillSize: CGSize) {
        
        if texture != nil {
            self.size = texture!.size()
            
            let verticalRatio = fillSize.height / self.texture!.size().height
            let horizontalRatio = fillSize.width /  self.texture!.size().width
            
            let scaleRatio = horizontalRatio > verticalRatio ? horizontalRatio : verticalRatio
            
            self.setScale(scaleRatio)
        }
    }
    
}
