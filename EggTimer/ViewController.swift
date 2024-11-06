//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
//    var softTime = 5
//    var mediumTime = 8
//    var hardTime = 12
    var eggTimes: [String: Int] = ["Soft":5, "Medium":8, "Hard":12]
    var secondsRemaining = 60
    var totalSeconds = 60
    
    @IBOutlet var quesstion: UILabel!
    @IBOutlet weak var progressbar: UIProgressView!
    
    var timer = Timer()
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        timer.invalidate()
        print(hardness)
        progressbar.progress = 0
        secondsRemaining = eggTimes[hardness]!
        totalSeconds = eggTimes[hardness]!
        
                switch hardness {
                case "Soft":
                    print(eggTimes["Soft"]!)
                case "Medium":
                    print(eggTimes["Medium"]!)
                case "Hard":
                    print(eggTimes["Hard"]!)
                default:
                    print("Error")
                }
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
//        switch hardness {
//        case "Soft":
//            print(softTime)
//        case "Medium":
//            print(mediumTime)
//        case "Hard":
//            print(hardTime)
//        default:
//            print("Error")
//        }
//        
        
//        if hardness == "Soft" {
//            print(softTime)
//        } else if hardness == "Medium" {
//            print(mediumTime)
//        }
//        else {
//            print(hardTime)
//        }
    }
    

    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds")
            progressbar.progress = Float(secondsRemaining) / Float(totalSeconds)
            secondsRemaining -= 1
        
        }
      else {
            print("Done!")
          progressbar.progress = 0
            quesstion.text = "Done!"
          playSound(audioName: "alarm_sound")
            timer.invalidate()
        }
    }
    
    
    
    
    var player: AVAudioPlayer!
 

  
    
    
    func playSound(audioName: String){
        let url = Bundle.main.url(forResource: audioName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
