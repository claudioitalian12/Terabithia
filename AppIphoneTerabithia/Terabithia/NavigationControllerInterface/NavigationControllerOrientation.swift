//
//  NavigationControllerOrientation.swift
//  Terabithia
//
//  Created by Claudio Cavalli on 21/02/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//


import UIKit

extension NavigationController {
    
    func shouldAutorotate() -> Bool {
        return true
    }
    
   func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        
        return [.portraitUpsideDown]
    }
}

