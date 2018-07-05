//
//  sound.swift
//  APPETIZING
//
//  Created by Pasquale Pacileo on 20/12/17.
//  Copyright © 2017 IOSFoundation. All rights reserved.
//

import Foundation
import SpriteKit
import AVFoundation
import AudioToolbox

class MusicManager {
    
    static let shared = MusicManager()
    var audioPlayer = AVAudioPlayer()
    
    private init() { }
    
    func setup(ResouceName: String, ExtensionType: String) {
        do {
            audioPlayer =  try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: ResouceName, ofType: ExtensionType)!))
            audioPlayer.prepareToPlay()
            
        } catch {
            print (error)
        }
    }
    
    func play() {
        audioPlayer.play()
    }
    
    func stop() {
        audioPlayer.pause()
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        audioPlayer.prepareToPlay()
    }
    func pause() {
        audioPlayer.pause()
    }
    
}
