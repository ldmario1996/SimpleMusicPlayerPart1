//
//  ViewController.swift
//  SimpleMusicPlayer
//
//  Created by Thang Le on 7/15/16.
//  Copyright © 2016 Thang Le. All rights reserved.
// play va pause nhac
// UISlider and element
// min image, max image
// min, max track Tint
// thumb tint
// thumb image


import UIKit
import AVFoundation

class ViewController: UIViewController {

   
    var changeState:Bool!
    @IBOutlet weak var slider_Volume: UISlider!
    @IBOutlet weak var btn_Play: UIButton!
    @IBAction func slider_Volume(sender: UISlider) {
            audio.volume = sender.value
        
        
        
    }
    var audio = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        audio = try!  AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("music", ofType: ".mp3")!))
        audio.play()
        addThumbImgForSlider()
        btn_Play.setImage(UIImage(named: "pause.png"), forState: UIControlState.Normal)
        changeState = false
    }
    func addThumbImgForSlider()
    {
        slider_Volume.setThumbImage(UIImage(named: "thumb.png"), forState: .Normal)
        slider_Volume.setThumbImage(UIImage(named: "thumbHightLight.png"), forState: .Highlighted)
        
    }
    @IBAction func action_Play(sender: UIButton) {
        audio.play()
        // play and pause
        //
        if changeState == true
        {
        audio.play()
            changeState = false
            btn_Play.setImage(UIImage(named:"pause.png"), forState: UIControlState.Normal)
        }
        else
        {
            audio.pause()
            changeState = true
            btn_Play.setImage(UIImage(named:"play.png"), forState: UIControlState.Normal)
        }
    }
    


}

