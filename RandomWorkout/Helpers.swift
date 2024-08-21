//
//  Helpers.swift
//  RandomWorkout
//
//  Created by Ginkgo on 12/30/14.
//  Copyright (c) 2014 Ginkgo. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

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
        
        guard Settings.playSound else { return }
        
        let audioPlayer = try? AVAudioPlayer(contentsOf: url as URL)
        audioPlayer!.prepareToPlay()
        
        audioPlayer!.play()
        
        //var mySound = NSSound(named:"Morse.aiff")
        //mySound.play()
    
    }
    
    class func fetchFirstImage(query: String, completion: @escaping (UIImage?) -> Void) {
        let apiKey = Bundle.main.object(forInfoDictionaryKey: "Api Key") as! String
        let searchEngineId = Bundle.main.object(forInfoDictionaryKey: "Search Engine") as! String
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        let urlString = "https://www.googleapis.com/customsearch/v1?q=\(encodedQuery)&cx=\(searchEngineId)&key=\(apiKey)&searchType=image&num=1"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let items = json["items"] as? [[String: Any]],
                   let firstItem = items.first,
                   let imageLink = firstItem["link"] as? String,
                   let imageUrl = URL(string: imageLink) {
                    
                    // Download the image data
                    let imageData = try Data(contentsOf: imageUrl)
                    
                    // Convert the data to a UIImage
                    let image = UIImage(data: imageData)
                    
                    completion(image)
                } else {
                    completion(nil)
                }
            } catch {
                completion(nil)
            }
        }
        
        task.resume()
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

//func fetchFirstImageURL(query: String, completion: @escaping (String?) -> Void) {
//    let apiKey = "AIzaSyBdgpDA1_ePiQFbi-UfwIk5RA-Y2iTxvoY"
////    let searchEngineId = "YOUR_SEARCH_ENGINE_ID"
//    let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//    
////    let urlString = "https://www.googleapis.com/customsearch/v1?q=\(encodedQuery)&cx=\(searchEngineId)&key=\(apiKey)&searchType=image&num=1"
//    
//    let urlString = "https://www.googleapis.com/customsearch/v1?q=\(encodedQuery)&key=\(apiKey)&searchType=image&num=1"
//    
//    guard let url = URL(string: urlString) else {
//        completion(nil)
//        return
//    }
//    
//    let task = URLSession.shared.dataTask(with: url) { data, response, error in
//        guard let data = data, error == nil else {
//            completion(nil)
//            return
//        }
//        
//        do {
//            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
//               let items = json["items"] as? [[String: Any]],
//               let firstItem = items.first,
//               let imageLink = firstItem["link"] as? String {
//                completion(imageLink)
//            } else {
//                completion(nil)
//            }
//        } catch {
//            completion(nil)
//        }
//    }
//    
//    task.resume()
//}





