//
//  SpeechRecognizer.swift
//  Terabithia
//
//  Created by Claudio Cavalli on 20/02/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//

import UIKit
import Speech

extension SpeechController{
    
    
    
/*
 func startRecording() throws {
     self.oldtest = textView.text + " "
    // Cancel the previous task if it's running.
    if let recognitionTask = recognitionTask {
        recognitionTask.cancel()
        self.recognitionTask = nil
    }
    
    let audioSession = AVAudioSession.sharedInstance()
    try audioSession.setCategory(AVAudioSessionCategoryRecord)
    try audioSession.setMode(AVAudioSessionModeMeasurement)
    try audioSession.setActive(true, with: .notifyOthersOnDeactivation)
    
    recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
    
    let inputNode = audioEngine.inputNode
    guard let recognitionRequest = recognitionRequest else { fatalError("Unable to created a SFSpeechAudioBufferRecognitionRequest object") }
    
    // Configure request so that results are returned before audio recording is finished
    recognitionRequest.shouldReportPartialResults = true
    
    // A recognition task represents a speech recognition session.
    // We keep a reference to the task so that it can be cancelled.
    recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest) { result, error in
        var isFinal = false
       
        if let result = result {
            self.sendata(text: result.bestTranscription.formattedString)
            
            self.textView.text = self.oldtest + result.bestTranscription.formattedString
            let bestString = result.bestTranscription.formattedString
            print(bestString)
            isFinal = result.isFinal
          // estrapolazione sottostringa e invio dati
            var lastString: String = ""
            for segment in result.bestTranscription.segments {
                let indexTo = bestString.index(bestString.startIndex, offsetBy: segment.substringRange.location)
                lastString = bestString.substring(from: indexTo)
                print(lastString)
                MultiPeer.instance.sendstringoptimize(object: lastString)
            }
            //
        }
        
        if error != nil || isFinal {
            self.audioEngine.stop()
            inputNode.removeTap(onBus: 0)
          
            self.recognitionRequest = nil
            self.recognitionTask = nil
            if(self.looprecognizer == true)
           {
     
        
        self.oldtest = self.oldtest + (result?.bestTranscription.formattedString)! + " "
          
            try! self.startRecording()
           
            }
       
        }
    }
    
    let recordingFormat = inputNode.outputFormat(forBus: 0)
    inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
        self.recognitionRequest?.append(buffer)
    }
    
    audioEngine.prepare()
    
    try audioEngine.start()
    
   
}*/
    
    func startRecording() throws {
       
        // Cancel the previous task if it's running.
        if recognitionTask != nil {
            recognitionTask?.cancel()
            recognitionTask = nil
        }
        
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try audioSession.setMode(AVAudioSessionModeMeasurement)
            try audioSession.setActive(true, with: .notifyOthersOnDeactivation)
        } catch {
            print("audioSession properties weren't set because of an error.")
        }
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        let inputNode = audioEngine.inputNode
        
        guard let recognitionRequest = recognitionRequest else {
            fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
        }
        
        recognitionRequest.shouldReportPartialResults = true
        var lastString: String = ""
        recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in
            var isFinal = false
            if(result?.bestTranscription.formattedString != nil){
                 DispatchQueue.main.async {
                    self.textView.text = self.oldtest + (result?.bestTranscription.formattedString)!}
     
                // estrapolazione sottostringa e invio dati
                let bestString = result?.bestTranscription.formattedString
                
                for segment in (result?.bestTranscription.segments)! {
                    let indexTo = bestString?.index((bestString?.startIndex)!, offsetBy: segment.substringRange.location)
                    lastString = (bestString?.substring(from: indexTo!))!
                  lastString = lastString + " "
                  
                    
                    }
     
                
                
                    print(lastString)
            
                
             
                
            }
            
                MultiPeer.instance.sendstringoptimize(object: lastString)
            
            if(result?.isFinal != nil)
            {  isFinal = (result?.isFinal)!}
            
            if isFinal || error != nil {
                let command = result?.bestTranscription.formattedString
               // print(command!)
                if command != nil {
                   self.audioEngine.inputNode.removeTap(onBus: 0)
                    
                    self.audioEngine.stop()
                    
                    self.recognitionRequest?.endAudio()
                    
                  //  self.recordButton.setTitle("Speak", for: .normal)
                    
                    if(self.looprecognizer == true)
                    {
                        
                        DispatchQueue.global().async  {
                               try! self.startRecording()
                         //   DispatchQueue.main.async {
                         //        self.oldtest = self.textView.text + " "
                         //   }
                        }
                     
                        
                        
                    }
                }
                
            }
        })
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
            self.recognitionRequest?.append(buffer)
          
        }
   
        audioEngine.prepare()
        
       
            try audioEngine.start()
       
        
    }
    
    public func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        if available {
            recordButton.isEnabled = true
            recordButton.setTitle("Start Recording", for: [])
        } else {
            recordButton.isEnabled = false
            recordButton.setTitle("Recognition not available", for: .disabled)
        }
    }

}
