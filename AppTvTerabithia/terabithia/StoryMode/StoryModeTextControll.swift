//
//  StoryModeTextControll.swift
//  terabithia
//
//  Created by Claudio Cavalli on 03/03/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//

import UIKit

extension StoryModeController{
    
    
    func karaoke(){
        //     let range = NSRange(location: manipulatorText.instance.searchstring(word: manipulatorText.instance.substring[i]),length: manipulatorText.instance.substring[i].count)
        
        DispatchQueue.main.async {
           
            
            self.textView.attributedText = manipulatorText.instance.changeattribute(substring: manipulatorText.instance.substring[i], location: manipulatorText.instance.searchstring(word: manipulatorText.instance.substring[i]))
            
 
            
            i = i + 1
            
            self.textView.textAlignment = NSTextAlignment.center
            
            
            if(manipulatorText.instance.substring[i] == "\n"){
              
                self.godown()
                
                
            }
            }
    }
    
    func godown(){
        //temp2 = temp2 + 1
        DispatchQueue.main.async {
          
            self.textView.attributedText = manipulatorText.instance.changeattribute(substring: manipulatorText.instance.substring[i], location: manipulatorText.instance.searchstring(word: manipulatorText.instance.substring[i]))
            //    self.asdw.setContentOffset(.init(x: 0, y: countd), animated: true)
            //    countd = countd + Double(self.asdw.frame.height)/3
            //    self.asdw.firstRect(for: self.asdw.)
            
            let range: NSRange = (manipulatorText.instance.replacetext as NSString).range(of: manipulatorText.instance.substring[i])
            let beginning: UITextPosition? = self.textView.beginningOfDocument
            let start: UITextPosition? = self.textView.position(from: beginning!, offset: range.location)
         //   print("lettera \(beginning) mentre \(start)")
            let end: UITextPosition? = self.textView.position(from: start!, offset: range.length)
            let textRange: UITextRange? = self.textView.textRange(from: start!, to: end!)
            var rect: CGRect = self.textView.firstRect(for: textRange!)
            
            rect.origin.x = self.textView.frame.minX
            self.textView.setContentOffset(rect.origin, animated: true)
            i = i + 1
            self.textView.textAlignment = NSTextAlignment.center
            
            
        }
    }
}
