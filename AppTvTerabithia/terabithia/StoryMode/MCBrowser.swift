//
//  MCBrowser.swift
//  Terabithia
//
//  Created by Claudio Cavalli on 14/02/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//

import Foundation
import MultipeerConnectivity

extension StoryModeSceneGestion: MCBrowserViewControllerDelegate{
    
    
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        print("Host was selected")
        dismiss(animated: true)
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        print("MCBrowser was cancelled")
        dismiss(animated: true)
    }
    
}

