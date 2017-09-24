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
    
    class func ConvertFloatToTimeMilli(_ time:Float) -> String{
        let minutes = floor(time/60)
        let seconds = round(time - minutes * 60)
        let milliseconds = round(time.truncatingRemainder(dividingBy: 1) * 100)
        return "\(AddZero(minutes)):\(AddZero(seconds)):\(AddZero(milliseconds))";
    }
    
    class func ConvertFloatToTime(_ time:Float) -> String{
        let minutes = floor(time/60)
        let seconds = round(time - minutes * 60)
        return "\(Int(minutes)):\(AddZero(seconds))";
    }
    
    class func ConvertFloatToTimeMilli(_ time:Double) -> String{
        let minutes = floor(time/60)
        let seconds = round(time - minutes * 60)
        let milliseconds = round(time.truncatingRemainder(dividingBy: 1) * 100)
        return "\(AddZero(minutes)):\(AddZero(seconds)):\(AddZero(milliseconds))";
    }
    
    class func ConvertFloatToTime(_ time:Double) -> String{
        let minutes = floor(time/60)
        let seconds = round(time - minutes * 60)
        return "\(Int(minutes)):\(AddZero(seconds))";
    }
    
    class func PlaySound(_ url:NSURL){
        
        let audioPlayer = try? AVAudioPlayer(contentsOf: url as URL)
        audioPlayer!.prepareToPlay()
        
        audioPlayer!.play()
        
        //var mySound = NSSound(named:"Morse.aiff")
        //mySound.play()
    
    }
    
}

private func AddZero(_ time:Float) -> String{
    if(time < 10){
        
        return "0\(Int(time))"
    }
    
    return "\(Int(time))"
}

private func AddZero(_ time:Double) -> String{
    if(time < 10){
        
        return "0\(Int(time))"
    }
    
    return "\(Int(time))"
}

private func AddZero(_ time:Int) -> String{
    if(time < 10){
        
        return "0\(Int(time))"
    }
    
    return "\(Int(time))"
}


extension Double {
    
    func Minutes() -> String {
        return "\(AddZero(Int(self)))"
    }
    
    mutating func Seconds() -> String {
        return "\(AddZero(Int(Darwin.round(self * 100)) % 100))"
    }
    
    mutating func MinutesAndSeconds() -> String {
        return "\(AddZero(Int(Darwin.round(self * 100)) % 100))"
    }
    
    init(minutes: Int, seconds: Int) {
        self = Double(minutes) + ( Double(seconds) / 100 )
    }
}

class ArrayWrapper<Type> {
    var array: [Type] = [Type]()
}





