//
//  Post.swift
//  colorblend
//
//  Created by Hafidz Ismail Hidayat on 24/07/23.
//

import SwiftUI

// Post Model And Sample Data...
struct Post: Identifiable {
    var id = UUID().uuidString
    var postImage: String
}
