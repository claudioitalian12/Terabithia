//
//  MainController.swift
//  Terabithia
//
//  Created by Claudio Cavalli on 20/02/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//

import UIKit

var timer = Timer()
var isinspeechController = false
class MainController: UIViewController{
     var timers = Timer()
    let list = ["","TvGame","","Help"]
    let listgif = ["skeleton-x4","bat-x4","ghost-x4","slime"]
    var imageArray = [UIImage(named: "flag-fr"),UIImage(named: "flag-us"),UIImage(named: "flag-it"),UIImage(named: "flag-ger")]
    @IBOutlet weak var GifImage: UIImageView!
    @IBOutlet weak var buttongif: UIButton!
    @IBOutlet weak var iconimage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIApplication.shared.isIdleTimerDisabled = false
    
         isinspeechController = false
         GifImage.loadGif(name: listgif[Int(arc4random_uniform(4))])
         Language.instance.set()
         iconimage.image = UIImage(named: "coollogo_com-22469705.png")
         iconimage.layer.shadowOpacity=0.4
         iconimage.clipsToBounds = true
         timer.invalidate()
        if(MultiPeer.instance.isConnected) {MultiPeer.instance.end()}
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func startgogif(_ sender: Any) {
        buttongif.isUserInteractionEnabled = false
           self.timers = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.sposta), userInfo: nil, repeats: true)
    }
    
    
    @objc func sposta(){
      
        self.GifImage.frame = CGRect(x: self.GifImage.frame.origin.x+7, y: self.GifImage.frame.origin.y, width: self.GifImage.frame.size.width, height: self.GifImage.frame.size.height)
        if(self.GifImage.frame.origin.x > UIScreen.main.nativeBounds.width){
            self.timers.invalidate()
            self.GifImage.frame.origin.x = 13
            buttongif.isUserInteractionEnabled = true
              GifImage.loadGif(name: listgif[Int(arc4random_uniform(3) + 0)])
        }
    }
}
