//
//  UnsplashClient.swift
//  PinterestClone
//
//  Created by David D on 12/27/18.
//  Copyright © 2018 David D. All rights reserved.
//

import Foundation

class UnsplashClient: APIClient {
    static let baseUrl = "https://api.unsplash.com"
    static let apiKey = unsplashApiKey
    
    func fetch(with endpoint: UnsplashEndpoint, completion: @escaping (Response<Photos>) -> Void) {
        let request = endpoint.request
        get(with: request, completion: completion)
    }
}
