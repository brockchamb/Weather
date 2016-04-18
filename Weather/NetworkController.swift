//
//  NetworkController.swift
//  Weather
//
//  Created by admin on 2/17/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit


class NetworkController {
    
    static func dataURL(completion:(returnedData:NSData?) -> Void) {
        let url = NSURL(string: "api.openweathermap.org/data/2.5/weather?q={city name}")!
        
        let dataTask = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, _, error) -> Void in
            if let error = error {
                print("Error with dataTask: \(error.localizedDescription)")
            }
            completion(returnedData: data)
        }
        dataTask.resume()
    }
    
    static func fetchImageAtURL(imageURLString:String, completion:(image: UIImage?) -> Void) {
        if let url = NSURL(string: imageURLString) {
        NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, _, error) -> Void in
            if let error = error {
                print(error.localizedDescription)
                completion(image: nil)
            }
            if let data = data {
                let image = UIImage(data: data)
                completion(image: image)
            }
        })
            .resume()
        } else {
            completion(image: nil)
        }
    }
}