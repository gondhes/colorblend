//
//  ColorData.swift
//  colorblend
//
//  Created by Hafidz Ismail Hidayat on 10/07/23.
//

import Foundation
import SwiftUI
//Marks - Color Data

struct colorModel: Identifiable, Hashable{
    let id: UUID = UUID()
    let title: String
    let listColor: [ListColor]
}

struct ListColor: Hashable {
    let color: Color
}
