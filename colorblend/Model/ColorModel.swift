//
//  ColorData.swift
//  colorblend
//
//  Created by Hafidz Ismail Hidayat on 10/07/23.
//

import Foundation
import SwiftUI
// Marks - Color Data

struct ColorModel: Identifiable, Hashable {
    let id: Int
    let title: String
    let listColor: [ListColor]
    var show: Bool

//    let listLabel: [ListLabel]
}

struct ListColor: Hashable {
    let color: Color
    let label: String
}

// struct ListLabel: Hashable{
//    let label: String
