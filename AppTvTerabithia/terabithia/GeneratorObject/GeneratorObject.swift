//
//  GeneratorObject.swift
//  terabithia
//
//  Created by Claudio Cavalli on 07/03/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//

import UIKit
import SpriteKit

public class GeneratorObject: SKScene{
    
    static public let instance = GeneratorObject()
    var objectbackground = SKSpriteNode()
    var characters = [SKSpriteNode]()
    var characterselected = [String]()
    var AnimationCharacters = [[SKTexture]]()
    var AnimationBackgroundArray = [SKTexture]()
    var compositioname = String()
    var positionx = -380
    func generator(singleton: StoryModeSceneGestion,width: CGFloat,height: CGFloat, name: String){
        
        
        
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
        
        if(temp == "fight"){fight(); print("asd")}
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
    
    func generatebackground(singleton: StoryModeSceneGestion, name: String){
        
        deletebackground(singleton: singleton)
        if(name == "room") {MusicManager.shared.setup(ResouceName: "MenuSelectSound", ExtensionType: "wav")
            MusicManager.shared.play()
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
    
    func deletebackground(singleton: StoryModeSceneGestion){
        // sleep(3)
        objectbackground.removeAllActions()
        AnimationBackgroundArray.removeAll()
        //   singleton.removeChildren(in: [objectbackground])
        singleton.removeAllChildren()
        MusicManager.shared.stop()
        
        characterselected.removeAll()
        positionx = -380
    }
    
    func generateCharacters(singleton: StoryModeSceneGestion, name: String, heigth: CGFloat){
        
        if(characterselected.count < 3){
            if(characterselected.contains(name) == false ){
                characterselected.append(name)
                characters.append(SKSpriteNode(imageNamed: name + "-0"))
                //     characters.last?.physicsBody?.affectedByGravity = false
              //  characters.last?.position = CGPoint(x: 0 , y: 0)
                //characters.last?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                characters.last?.size.width = 340
                characters.last?.size.height = 500
                // characters.last?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                if(name == "nonna"){
                characters.last?.zPosition = -8
                characters.last?.size.width = 340
                    characters.last?.size.height = 500}
                if(name == "cappuccetto" || name == "cacciatore"){
                    characters.last?.size.width = 400
                    characters.last?.size.height = 600
                }
                //    characters.last?.xScale = 0.9
                //    characters.last?.yScale = 0.9
                if( name == "lupo"){
                    characters.last?.size.width = 450
                    characters.last?.size.height = 680
                }
         
                characters.last?.position = CGPoint(x: positionx , y: -100)
                positionx = positionx + 450
            
                /*    if(name == "rabbit"){
                 characters.last?.zPosition = -8
                 characters.last?.xScale = 0.9
                 characters.last?.yScale = 0.9
                 
                 characters.last?.position = CGPoint(x: Int(arc4random_uniform(UInt32(singleton.size.width/2))) - Int(arc4random_uniform(UInt32(singleton.size.width/4))), y: -200)
                 }*/
                
                /*   if(name == "tesla"){
                 characters.last?.zPosition = -8
                 characters.last?.xScale = 0.9
                 characters.last?.yScale = 0.9
                 
                 characters.last?.position = CGPoint(x: Int(arc4random_uniform(UInt32(singleton.size.width/2))) - Int(arc4random_uniform(UInt32(singleton.size.width/4))), y: -50)
                 }*/
                singleton.addChild((characters.last)!)
                
                var i = 0
                var temp = [SKTexture]()
                while(true){
                    print(name + "-" + String(i))
                    let fileimg = Bundle.main.url(forResource: name + "-" + String(i), withExtension: "png", subdirectory:"Characters1")
                    if (fileimg == nil){
                        break
                    }
                    
                    temp.append(SKTexture(imageNamed: name + "-" + String(i)))
                    print(name + "-" + String(i))
                    i = i + 1
                    
                }
                AnimationCharacters.append(temp)
                
                
            }
            
        }
        else { //positionx = -330
           // characterselected.removeAll()
        }
        
    }
    
    
    func fight(){
        for i in 0..<characters.count{
            characters[i].run(SKAction.repeatForever(SKAction.animate(with: AnimationCharacters[i], timePerFrame: 0.1)))
            
        }
        
    }
    
    func inizial(){
        
    }
    

}



