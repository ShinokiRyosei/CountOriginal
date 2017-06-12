//
//  ViewController.swift
//  CountOriginal
//
//  Created by ShinokiRyosei on 2016/02/01.
//  Copyright © 2016年 ShinokiRyosei. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVSpeechSynthesizerDelegate {

    @IBOutlet var label: UILabel!
    var number: Int = 0
    let synthesizer = AVSpeechSynthesizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        synthesizer.delegate = self
        //        synthesizer.accessibilityActivate()

        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)

            do{
                try AVAudioSession.sharedInstance().setActive(true)
            }catch{

            }
        }catch{

        }
    }

    @IBAction func plus () {
        number = number + 1
        label.text = String(number)

        let voiceText = AVSpeechUtterance(string: String(number))
        voiceText.voice = AVSpeechSynthesisVoice(language: "en_US")
        self.synthesizer.speak(voiceText)
    }

    @IBAction func minus() {
        number = number - 1
        label.text = String(number)

        let voiceText = AVSpeechUtterance(string: String(number))
        voiceText.voice = AVSpeechSynthesisVoice(language: "ja_JP")
        self.synthesizer.speak(voiceText)
    }
    
    
}

