//
//  AnimationPrepareForSegueMain.swift
//  Terabithia
//
//  Created by Claudio Cavalli on 21/02/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//

import UIKit
extension MainController{
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // No problem to force unwrap in this case, since we know sender is an instance of UIButton
        let button = sender as! UIButton
        
        // Set the circleOrigin property of the segue to the center of the button
        (segue as! OHCircleSegue).circleOrigin = button.center
    }
}


