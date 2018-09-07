//
//  ViewController.swift
//  crazyMaze
//
//  Created by Tenju Paul on 9/6/18.
//  Copyright © 2018 Tenju Paul. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        audio.volume = 0.3
        performSegue(withIdentifier: "playSegue", sender: nil)
    }
    
    var audio = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let audioPath = Bundle.main.path(forResource: "background", ofType: "mp3")
            try audio = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        } catch {
            //process error
        }
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSessionCategoryPlayback)
        } catch {
            //process error
        }
        audio.numberOfLoops = -1
        audio.volume = 1
        audio.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

