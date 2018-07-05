//
//  SpeechRecognizerOrientation.swift
//  Terabithia
//
//  Created by Claudio Cavalli on 24/02/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//


import UIKit
extension SpeechController {
    
    func shouldAutorotate() -> Bool {
        return true
    }
    
    func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        
        return [.portrait, .portraitUpsideDown]
    }
}

