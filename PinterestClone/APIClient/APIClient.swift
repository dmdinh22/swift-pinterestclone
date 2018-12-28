//
//  APIClient.swift
//  PinterestClone
//
//  Created by David D on 12/26/18.
//  Copyright © 2018 David D. All rights reserved.
//

import Foundation

enum Response<T> {
    case success(T)
    case error(Error)
}

enum APIError: Error {
    case unknown, badResponse, jsonDecoder, imageDownload, imageConvert
}

protocol APIClient {
    var session: URLSession { get }
    func get<T: Codable>(with request: URLRequest, completion: @escaping (Response<[T]>) -> Void)
}

extension APIClient {
    var session: URLSession {
        return URLSession.shared
    }
    
    func get<T: Codable>(with request: URLRequest, completion: @escaping (Response<[T]>) -> Void) {
        let task = session.dataTask(with: request) { (data, response, error) in guard error == nil else {
            completion(.error(error!))
            return
            }
            
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                completion(.error(APIError.badResponse))
                return
            }
            
            // decode JSON object from API response
            guard let value = try? JSONDecoder().decode([T].self, from: data!) else {
                completion(.error(APIError.jsonDecoder))
                return
            }
            
            DispatchQueue.main.async {
                completion(.success(value))
            }
        }
        task.resume()
    }
}
