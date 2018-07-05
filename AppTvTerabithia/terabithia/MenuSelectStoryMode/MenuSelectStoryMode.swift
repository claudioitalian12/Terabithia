//
//  MenuSelectStoryMode.swift
//  terabithia
//
//  Created by Claudio Cavalli on 04/03/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//

import UIKit

class MenuSelectStoryMode: UIViewController {

    @IBOutlet weak var background: UIImageView!
   
   
    
    @IBOutlet weak var vampire: UIImageView!
    @IBOutlet weak var money: UIImageView!
    @IBOutlet weak var money1: UIImageView!
    @IBOutlet weak var Shadowman: UIImageView!

    var imageArray = [UIImage(named: "book"),UIImage(named: "book"),UIImage(named: "book"),UIImage(named: "book"),UIImage(named: "book"),UIImage(named: "book")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        FantasyModeSpriteKit.instance.removeAllActions()
        FantasyModeSpriteKit.instance.removeAllChildren()
    
        // Do any additional setup after loading the view.
   background.image = UIImage(named: "BackgroundMenu")
    money.loadGif(name: "money")
    money1.loadGif(name: "money")
        Shadowman.loadGif(name: "shadowman")
        
        vampire.loadGif(name: "vampire")
     //   MusicManager.shared.setup(ResouceName: "MenuSelectSound", ExtensionType: "wav")
      //  MusicManager.shared.play()
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
