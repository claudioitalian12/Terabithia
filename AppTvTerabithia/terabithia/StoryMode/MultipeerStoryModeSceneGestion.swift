//
//  MultipeerStoryModeController.swift
//  terabithia
//
//  Created by Claudio Cavalli on 02/03/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//

import UIKit
import UIKit
import SpriteKit
import GameplayKit
import AVKit
import MultipeerConnectivity

extension StoryModeSceneGestion: MCSessionDelegate{
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        DispatchQueue.main.async {
            
            if  let d = try! (NSKeyedUnarchiver.unarchiveObject(with: data) as? String){
                switch(d){
                case "autunnale","autunno": do {print("okkkkkkkkkkk");
                    
                    break;}
                }
            }
        }
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
    
    
    
    
    
}
