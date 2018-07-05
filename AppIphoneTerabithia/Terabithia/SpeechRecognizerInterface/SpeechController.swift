//
//  ViewController.swift
//  Terabithia
//
//  Created by Claudio Cavalli on 20/02/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//

import UIKit
import Speech



class SpeechController: UIViewController, SFSpeechRecognizerDelegate {
    // MARK: Properties

   
   
    
    var speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: Language.instance.setlanguage()))!

     var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    
     var recognitionTask: SFSpeechRecognitionTask?
    
     let audioEngine = AVAudioEngine()
    
    
    
    var looprecognizer = true
     var oldtest = ""
    @IBAction func Back(_ sender: Any) {
        MultiPeer.instance.end()
        audioEngine.inputNode.removeTap(onBus: 0)
        audioEngine.stop()
        timer.invalidate()
        self.looprecognizer = false
        audioEngine.stop()
        recognitionRequest?.endAudio()
        recordButton.isEnabled = true
        recordButton.setTitle("Start Recording", for: [])
        performSegue(withIdentifier: "back", sender: self)
    }
    @IBOutlet var textView : UITextView!
    
    @IBOutlet weak var textViewButtonShadow: UIButton!
    @IBOutlet var recordButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isIdleTimerDisabled = true
        

        // Do any additional setup after loading the view, typically from a nib.
       
           
       
        print(Language.instance.setlanguage())
      //  SpeechRecognizerClas.instance.initializes(Local: language.setlanguage())


        recordButton.isEnabled = false
        // recordButton.isHidden = true
        if ( MultiPeer.instance.isConnected == false){
        MultiPeer.instance.initialize(serviceType: "Terabithia")
            MultiPeer.instance.startInviting()}
       self.startTimer()

       oldtest = ""
        
        textView.layer.shadowOpacity=0.4
        textView.isEditable = false
        
       
       
        recordButton.clipsToBounds = false
        recordButton.layer.shadowOpacity = 0.4
        textViewButtonShadow.clipsToBounds = false
        textViewButtonShadow.layer.shadowOpacity = 0.4
         isinspeechController = true
        
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    

   
    
}


