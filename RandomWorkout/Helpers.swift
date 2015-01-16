//
//  Helpers.swift
//  RandomWorkout
//
//  Created by Ginkgo on 12/30/14.
//  Copyright (c) 2014 Ginkgo. All rights reserved.
//

import Foundation
import AVFoundation

class Helpers {
    
    class func ConvertFloatToTimeMilli(time:Float) -> String{
        var minutes = floor(time/60)
        var seconds = round(time - minutes * 60)
        var milliseconds = time%1 * 100
        return "\(AddZero(minutes)):\(AddZero(seconds)):\(AddZero(milliseconds))";
    }
    
    class func ConvertFloatToTime(time:Float) -> String{
        var minutes = floor(time/60)
        var seconds = round(time - minutes * 60)
        return "\(Int(minutes)):\(AddZero(seconds))";
    }
    
    private class func AddZero(time:Float) -> String{
        if(time < 10){
        
            return "0\(Int(time))"
        }
        
        return "\(Int(time))"
    }
    
    class func PlaySound(url:NSURL){
        
        var audioPlayer = AVAudioPlayer(contentsOfURL: url, error: nil)
        audioPlayer.prepareToPlay()
        
        audioPlayer.play()
        
        //var mySound = NSSound(named:"Morse.aiff")
        //mySound.play()
    
    }
    
}




