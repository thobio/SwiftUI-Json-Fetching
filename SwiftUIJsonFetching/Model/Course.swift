//
//  Course.swift
//  SwiftUIJsonFetching
//
//  Created by Zerone on 30/09/19.
//  Copyright © 2019 Thobio. All rights reserved.
//

import Foundation

struct Course: Identifiable, Decodable {
    let id = UUID()
    let name: String
    let price: Int
}
