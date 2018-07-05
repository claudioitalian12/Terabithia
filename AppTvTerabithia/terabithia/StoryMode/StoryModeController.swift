//
//  StoryModeController.swift
//  terabithia
//
//  Created by Claudio Cavalli on 01/03/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVKit
import MultipeerConnectivity
var i = 0

var temp = ""
var temp2 = 0
class StoryModeController: UIViewController, MultiPeerDelegate {
@IBOutlet weak var textView: UITextView!

    
    @IBOutlet weak var container: UIView!
 
       var Multipeerconn = MultiPeer.init()
    
    func multiPeer(connectedDevicesChanged devices: [String]) {
        
    }
    
    func multiPeer(didReceiveData data: Data) {
        
        DispatchQueue.global().async {
        
     
        if  let text = try! (NSKeyedUnarchiver.unarchiveObject(with: data) as? String){
             if(temp != text.dropLast().uppercased() ) {
          print("ufficiale- " + text.dropLast().uppercased() + "-uguale- " + manipulatorText.instance.substring[temp2].uppercased())
            if(manipulatorText.instance.substring[temp2] == "\n"){
                temp2 = temp2 + 1}
            if(text.dropLast().uppercased() == "ANDO" || text.dropLast().uppercased() == "INCONTRO" || text.dropLast().uppercased() == "ENTRO" || text.dropLast().uppercased() == "GUARDO" || text.dropLast().uppercased() == "ARRIVO" || text.dropLast().uppercased() == "MANGIO" || text.dropLast().uppercased() == "USCI"){
                temp2 = temp2 + 1
                self.karaoke()
       
                
            }
                     print(text.dropLast())
            if(text.dropLast().uppercased() == manipulatorText.instance.substring[temp2].uppercased()){
              temp2 = temp2 + 1
                    self.karaoke()
                     StoryModeSceneGestion.instance.addObjecttoTheScreen(names: text.dropLast().lowercased())
          
               
            }
             
                
            if(text.dropLast().uppercased() == manipulatorText.instance.substring[temp2].uppercased() + "'" +  manipulatorText.instance.substring[temp2+1].uppercased() ){
                temp2 = temp2 + 2
                self.karaoke()
                self.karaoke()
        
      
              
            }
        
      
                 DispatchQueue.main.async {
              
                if(text.dropLast().uppercased() == "AVANTI" || text.dropLast().uppercased() == "DAVANTI"){
                 //   error = 0
                temp2 = temp2 + 1
                    self.karaoke()
             
                    }}
            
            
                temp = text.dropLast().uppercased()
        
            }
        }
           
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        StoryModeSceneGestion.instance.removeAllChildren()
        StoryModeSceneGestion.instance.removeAllActions()
        manipulatorText.instance.defaultSet(stringa: "")
        i = 0
        temp2 = 0
        temp = ""
        // Do any additional setup after loading the view.
      
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            
        
                // Set the scale mode to scale to fit the window
           
        
                StoryModeSceneGestion.instance.anchorPoint = (SKScene(fileNamed: "StoryModeScene")?.anchorPoint)!
                StoryModeSceneGestion.instance.size.width = (SKScene(fileNamed: "StoryModeScene")?.frame.width)!
                StoryModeSceneGestion.instance.size.height = (SKScene(fileNamed: "StoryModeScene")?.frame.height)!
                // <SKScene> name:'(null)' frame:{{-0, -0}, {1, 1}} anchor:{0, 0}
               // <SKScene> name:'(null)' frame:{{-375, -667}, {750, 1334}} 
                // Present the scene
           let scene = StoryModeSceneGestion.instance.scene
            scene?.scaleMode = .aspectFill
                view.presentScene(scene)
                 StoryModeSceneGestion.instance.addBG()
            
      //      StoryModeSceneGestion.instance.addBG()
            view.ignoresSiblingOrder = true
            view.showsFPS = false
            view.showsPhysics = false
            view.showsNodeCount = false
        }
        
        Multipeerconn.initialize(serviceType: "Terabithia", deviceName: "host")
        Multipeerconn.startAccepting()
        Multipeerconn.delegate = self
   
        //////////////
        textView.becomeFirstResponder()
        textView.isUserInteractionEnabled = true
        textView.isSelectable = true
        textView.isScrollEnabled = true
        textView.bounces = true
        let fileURLProject = Bundle.main.path(forResource: "ProjectTextFile", ofType: "txt")
        // Read from the file
        var text = ""
        do {
            text = try String(contentsOfFile: fileURLProject!, encoding: String.Encoding.utf8)
        } catch _ as NSError {
              print("Failed reading from URL")
        }
        
  
//        let fileimg = Bundle.main.path(forResource: "apple-0", ofType: "png", inDirectory: "Mela")
     //   let fileimg = Bundle.main.url(forResource: "apple-0", withExtension: "png", subdirectory:"Mela")
    //    var textt = ""
     //   do{
     //       textt = String(describing: fileimg!)
     //       print(textt)
     //   }
        
        manipulatorText.instance.defaultSet(stringa: text)
        textView.attributedText = manipulatorText.instance.myMutableString
        textView.textAlignment = NSTextAlignment.center
        ///////////////////////////////
        // 09C52DEE-3FF3-4AD0-99FB-137C0CA77F61
        // 9B39A44F-E299-43DD-8660-4CF6E0BA63C7
       // _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(continues), userInfo: nil, repeats: true)
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
