//
//  MultipeerControlConnectSpeachController.swift
//  Terabithia
//
//  Created by Claudio Cavalli on 21/02/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//

import UIKit
import Speech
import MultipeerConnectivity

extension SpeechController{
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.controlstatemultipeer), userInfo: nil, repeats: true)
    }
    
    @objc func controlstatemultipeer(){
     
      if ( MultiPeer.instance.isConnected == true)
          {timer.invalidate()
          createAlert(title: "Connecting", message: "you are connecting")
            MultiPeer.instance.stopAccepting()
        }
        
    }
    
}
