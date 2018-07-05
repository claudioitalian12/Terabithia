//
//  Manipulatortext.swift
//  neverdogs
//
//  Created by Claudio Cavalli on 27/02/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//

import UIKit

class manipulatorText{
    public static let instance = manipulatorText()
    var text = String()
    var replacetext = String()
    var substring = [String]()
    
    var myMutableString = NSMutableAttributedString()
    
    func defaultSet(stringa: String){
        self.text = stringa
        self.replacetext = stringa
        
        self.substring = extractSubstring()
        
        
        self.myMutableString = NSMutableAttributedString(string: self.text)
        
        
        self.myMutableString.setAttributes([NSAttributedStringKey.font : UIFont(name: "Helvetica", size: CGFloat(70.0))!
            , NSAttributedStringKey.foregroundColor : UIColor.white], range: NSRange(location:0,length: self.text.count))
        
        
    }
    
    func getString()-> String{
        return self.text
        
    }
    
    func defaultAttribute() -> NSAttributedString{
        self.myMutableString = NSMutableAttributedString(string: self.text)
        self.myMutableString.setAttributes([NSAttributedStringKey.font : UIFont(name: "Helvetica", size: CGFloat(90.0))!
            , NSAttributedStringKey.foregroundColor : UIColor(red: 30 / 255.0, green: 40 / 255.0, blue: 80 / 255.0, alpha: 1.0)], range: NSRange(location:0,length: self.text.count))
        return self.myMutableString
    }
    
    
    func getAttribute()-> NSAttributedString{
        return self.myMutableString
    }
    
    func extractSubstring()->[String]{
        
        var temprow = self.text.components(separatedBy: .newlines)
        
        var substring = [String]()
        for i in 0..<temprow.count {
            
            var tempstring2 = temprow[i].components(separatedBy: .whitespaces)
            
            
            for j in 0..<tempstring2.capacity{
                
                var x = tempstring2[j].components(separatedBy: .punctuationCharacters)
                for k in 0..<x.capacity{
                    if(x[k] != ""){
                        substring.append(x[k])
                        
                    }
                }
                
                
                
            }
            
            substring.append("\n")
            
        }
        return substring
    }
    
    
    func searchstring(word: String) -> Int{
        var replacestring = String()
        if let range = self.replacetext.range(of: word) {
            for _ in range.lowerBound.encodedOffset..<range.upperBound.encodedOffset
            {replacestring.append("-")}
            self.replacetext.replaceSubrange(range, with: replacestring)
            
            
            return range.lowerBound.encodedOffset
            
        }
        
        // alternative: not case sensitive
        if let range = self.replacetext.range(of: word) {
            for _ in range.lowerBound.encodedOffset..<range.upperBound.encodedOffset
            {replacestring.append("-")}
            self.replacetext.replacingCharacters(in: range, with: replacestring)
            
            
            return range.lowerBound.encodedOffset
            
        }
        
        return -1
    }
    
    
    func changeattribute(substring: String, location: Int)-> NSAttributedString{
        
        
      
       
        
        self.myMutableString.setAttributes([NSAttributedStringKey.font : UIFont(name: "Helvetica", size: CGFloat(70.0))!
            , NSAttributedStringKey.foregroundColor : UIColor.orange], range: NSRange(location:location,length: substring.count))
            
       
        
        return self.myMutableString
        
    }
    
    
    
}

