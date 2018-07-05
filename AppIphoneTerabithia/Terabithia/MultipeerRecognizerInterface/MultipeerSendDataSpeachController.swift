//
//  MultipeerSendDataSpeachController.swift
//  Terabithia
//
//  Created by Claudio Cavalli on 21/02/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//

import UIKit

extension SpeechController{
    
    func sendata(text: String){
        if(MultiPeer.instance.isConnected == true){
        let text = NSKeyedArchiver.archivedData(withRootObject: text)
        MultiPeer.instance.send(data: text, type: 0)
        }
    }
   
    
}
