//
//  UnspalhImages.swift
//  PinterestClone
//
//  Created by David D on 12/26/18.
//  Copyright © 2018 David D. All rights reserved.
//

import Foundation

// type for array response
typealias Photos = [Photo]

struct Photo: Codable {
    let id: String
    let urls: URLs
}

struct URLs: Codable {
    let raw: URL
    let full: URL
    let regular: URL
    let small: URL
    let thumb: URL
}
