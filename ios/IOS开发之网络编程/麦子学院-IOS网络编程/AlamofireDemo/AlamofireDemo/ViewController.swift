//
//  ViewController.swift
//  AlamofireDemo
//
//  Created by Benjamin on 11/22/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    var photos = NSMutableOrderedSet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func getRequest(sender: UIButton) {
        Alamofire.request(.GET, "https://api.500px.com/v1/photos", parameters: ["consumer_key": "HZF1kF8RxAYBJPLOZik25NpBqyLslwA8ksUOH13L"]).responseJSON { response in
            if let json = response.result.value {
                print("JSON: \(json)")
                let j = json as! NSDictionary
                var safePhotos = j.valueForKey("photos") as! [NSDictionary]
                safePhotos = safePhotos.filter{
                    $0["nsfw"] as! Bool == false
                }
                let newPhotos = safePhotos.map{
                    //封装object
                    PhotoInfo(id: $0["id"] as! Int, imageUrl: $0["image_url"] as! String)
                }
                //把newPhotos加入集合中。用于前台显示
                self.photos.addObjectsFromArray(newPhotos)
            }
        }
        /*Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo": "bar"]).responseJSON { response in
            print(response.request!) // original URL request
            print(response.response!)    // URL response
//            print(response.data)    // server data
            print(response.result)  // result of response serialization
            if let json = response.result.value {
                print("JSON: \(json)")
            }
        }.responseString { response in
                print("Success: \(response.result.isSuccess)")
                print("Response String: \(response.result.value)")
        }*/
        /*Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo": "bar"])
            .response { request, response, data, error in
                print(request)
                print(response)
                print(data)
                print(error)
        }*/
        /*Alamofire.request(.GET, "https://httpbin.org/get")
            .responseString { response in
                print("Success: \(response.result.isSuccess)")
                print("Response String: \(response.result.value)")
        }*/
        /*let user = "tarenacode"
        let password = "code_2013"
        Alamofire.request(.GET, "http://code.tarena.com.cn")
            .authenticate(user: user, password: password)
            .responseJSON { response in
                let data = NSString(data: response.data!, encoding: 0)!
                print(data)
        }*/
    }

    @IBAction func postRequest(sender: UIButton) {
    }
}

