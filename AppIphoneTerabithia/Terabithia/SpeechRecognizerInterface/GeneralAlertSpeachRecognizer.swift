//
//  GeneralAlert.swift
//  Terabithia
//
//  Created by Claudio Cavalli on 21/02/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//

import UIKit
extension SpeechController {
    
    func createAlert (title:String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
