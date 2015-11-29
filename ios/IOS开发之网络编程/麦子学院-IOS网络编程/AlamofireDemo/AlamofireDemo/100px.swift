//
//  100px.swift
//  AlamofireDemo
//
//  Created by Benjamin on 11/23/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import Foundation
import Alamofire

class PhotoInfo {
    var id: Int!
    var imageUrl: String!
    init (id: Int, imageUrl: String) {
        self.id = id
        self.imageUrl = imageUrl
    }
}

enum ImageSize: Int {
    case Tiny = 1
    case small = 2
    case Medium = 3
    case Large = 4
    case XLarge = 5
}

enum Router: URLRequestConvertible {
    static let baseURLString = "https://api.500px.com/v1"
    static let consumerKey = "HZF1kF8RxAYBJPLOZik25NpBqyLslwA8ksUOH13L"
    
    //单张图片
    case Photo(Int, ImageSize)
    //popular图片
    case Popular(Int)
    
    var URLRequest: NSMutableURLRequest {
        let urlGroup: (path: String, parameters: [String: AnyObject]) = {
            switch self {
            case .Photo(let id, let imageSize):
                let params = [
                    "consumer_key": Router.consumerKey,
                    "image_size": "\(imageSize.rawValue)"
                ]
                return ("/photos/\(id)", params)
                
            case .Popular(let page):
                let params = [
                    "consumer_key": Router.consumerKey,
                    "page": "\(page)"
                ]
                return ("/photos", params)
            }
        }()
        let url = NSURL(string: Router.baseURLString)!
        let request = NSURLRequest(URL: url.URLByAppendingPathComponent(urlGroup.path))
        return Alamofire.ParameterEncoding.URL.encode(request, parameters: urlGroup.parameters).0
    }
}
