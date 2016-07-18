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
// slider duration keo
// repeat 
//audio.numberofloops
//audio.on, UISwitch
// on repeat -1, off = 0
// khi het bai if repeat =0 -> button change to play
// avaudioplayerdelegate



import UIKit
import AVFoundation
class ViewController: UIViewController,AVAudioPlayerDelegate
{
    @IBOutlet weak var lbl_totalTime: UILabel!
    @IBOutlet weak var lbl_timeLeft: UILabel!
    @IBAction func btn_changemusic(sender: UISlider)
    {
        audio.currentTime = Double(sender.value) * audio.duration
        Slider_duration.setThumbImage(UIImage(named: "thumb.png"), forState: .Normal)
        Slider_duration.setThumbImage(UIImage(named: "thumbHightLight.png"), forState: .Highlighted)
    }
    
    @IBAction func button_replay(sender: UISwitch)
    {
//        if outlet_switch.on{
//            audio.numberOfLoops = -1
//            audio.play()
//          
//        }
//        else {
//            audio.numberOfLoops = 0
//            audio.stop()
            
        //}
    }
    @IBAction func btn_stop(sender: UIButton)
    {
        audio.stop()
        audio.currentTime = 0
        changeState = true
        btn_Play.setImage(UIImage(named:"play.png"), forState: UIControlState.Normal)
    }
    
    
    var changeState:Bool!
    
    @IBOutlet weak var slider_Volume: UISlider!
    @IBOutlet weak var btn_Play: UIButton!
    @IBAction func slider_Volume(sender: UISlider)
    {
            audio.volume = sender.value
    }
    
    @IBOutlet weak var outlet_switch: UISwitch!
    @IBOutlet weak var Slider_duration: UISlider!
    var audio = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audio = try!
        AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("katyperry", ofType: ".mp3")!))
        audio.play()
        audio.delegate = self
        addThumbImgForSlider()
        btn_Play.setImage(UIImage(named: "pause.png"), forState: UIControlState.Normal)
        changeState = false
        audio.currentTime = 0
        let timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(updateTimeLeft), userInfo: nil, repeats: true)
         totalTime()
    }
    
    func updateTimeLeft()
    {
        self.lbl_timeLeft.text = String(format: "%2.2f",
        audio.currentTime / 60)
        self.Slider_duration.value = Float(audio.currentTime / audio.duration)
    }
    func totalTime()
    {
        self.lbl_totalTime.text = String(format: "%2.2f", audio.duration/60)
    
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
        changeStatefunc()
    }
    func changeStatefunc()
    {
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
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool){
        if outlet_switch.on
        {
            audio.play()
            btn_Play.setImage(UIImage(named:"pause.png"), forState: UIControlState.Normal)
        }
        else
        {
            btn_Play.setImage(UIImage(named:"play.png"), forState: UIControlState.Normal)
        }
    }

}

