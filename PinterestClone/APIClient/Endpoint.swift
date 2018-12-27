//
//  UnsplashEndpoint.swift
//  PinterestClone
//
//  Created by David D on 12/27/18.
//  Copyright © 2018 David D. All rights reserved.
//

import Foundation

protocol Endpoint {
    var baseURL: String {get}
    var path: String {get}
    var urlParameters: [URLQueryItem] {get}
}

extension Endpoint {
    // parses URLs & constucts URLs from parts
    var urlComponent: URLComponents {
        var urlComponent = URLComponents(string: baseURL)
        urlComponent?.path = path
        urlComponent?.queryItems = urlParameters

        return urlComponent!
    }

    var request: URLRequest {
        return URLRequest(url: urlComponent.url!)
    }
}

enum Order: String {
    case popular, latest, oldest
}

enum UnsplashEndpoint: Endpoint {
    case photos(id: String, order: Order)
    
    var baseURL: String {
        return "https://api.unsplash.com"
    }
    
    var path: String {
        switch self {
        case .photos:
            return "/photos"
        }
    }
    
    var urlParameters: [URLQueryItem] {
        switch self {
        case .photos(let id, let order):
            return [
                URLQueryItem(name: "client_id", value: id),
                URLQueryItem(name: "order_by", value: order.rawValue)
            ]
        }
    }
}
