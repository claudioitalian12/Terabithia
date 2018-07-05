//
//  UISpeechRecognizer.swift
//  Terabithia
//
//  Created by Claudio Cavalli on 20/02/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//

import UIKit
import Speech

extension SpeechController{

// MARK: Interface Builder actions Button Recognizer - quello che registra
@IBAction func recordButtonTapped() {
   
    if  audioEngine.isRunning {
        
        recognitionRequest?.shouldReportPartialResults = false
         self.looprecognizer = false
        audioEngine.inputNode.removeTap(onBus: 0)
        audioEngine.stop()
        recognitionRequest?.endAudio()
        
     //   recordButton.isEnabled = false
    //    recordButton.setTitle("Stopping", for: .disabled)
       
        recordButton.isEnabled = true
        recordButton.setTitle("Start Recording", for: [])
       
    } else {
        self.oldtest = self.textView.text + " "
        try! startRecording()
       self.looprecognizer = true
       
        recordButton.setTitle("Pause recording", for: [])
    }
}
    
    // MARK: UIViewController
    
    
    override public func viewDidAppear(_ animated: Bool) {
       // SpeechRecognizerClas.instance.speechRecognizer?.delegate = self
        speechRecognizer.delegate = self
         createAlert(title: "Connecting", message: "waiting a second")
        
        SFSpeechRecognizer.requestAuthorization { authStatus in
            /*
             The callback may not be called on the main thread. Add an
             operation to the main queue to update the record button's state.
             */
            OperationQueue.main.addOperation {
                switch authStatus {
                case .authorized:
                    self.recordButton.isEnabled = true
                    
                case .denied:
                    self.recordButton.isEnabled = false
                    self.recordButton.setTitle("User denied access to speech recognition", for: .disabled)
                    
                case .restricted:
                    self.recordButton.isEnabled = false
                    self.recordButton.setTitle("Speech recognition restricted on this device", for: .disabled)
                    
                case .notDetermined:
                    self.recordButton.isEnabled = false
                    self.recordButton.setTitle("Speech recognition not yet authorized", for: .disabled)
                }
            }
        }
    }
    
    
}

