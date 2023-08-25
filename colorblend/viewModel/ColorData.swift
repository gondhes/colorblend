//
//  ColorData.swift
//  colorblend
//
//  Created by Hafidz Ismail Hidayat on 10/07/23.
//

import Foundation
import SwiftUI
// Marks - Color Data

class ColorData {
    var data = [
        ColorModel(id: 0, title: "White",
                   listColor: [
                    ListColor(color: Color("Black"), label: "Black"),
                    ListColor(color: Color("Pink"), label: "Pink"),
                    ListColor(color: Color("Red"), label: "Red"),
                    ListColor(color: Color("Orange"), label: "Orange"),
                    ListColor(color: Color("Beige"), label: "Beige"),
                    ListColor(color: Color("Yellow"), label: "Yellow"),
                    ListColor(color: Color("Green"), label: "Green"),
                    ListColor(color: Color("Light Blue"), label: "Light Blue"),
                    ListColor(color: Color("Navy"), label: "Navy"),
                    ListColor(color: Color("Purple"), label: "Purple"),
                    ListColor(color: Color("Brown"), label: "Brown"),
                    ListColor(color: Color("Grey"), label: "Grey"),
                    ListColor(color: Color("Green2"), label: "Green")],
                   show: false
                  ),

        ColorModel(id: 1, title: "Beige",
                   listColor: [
                    ListColor(color: Color("Black"), label: "Black"),
                    ListColor(color: Color("Brown"), label: "Brown"),
                    ListColor(color: Color("Red"), label: "Red"),
                    ListColor(color: Color("Green"), label: "Green"),
                    ListColor(color: Color("Navy"), label: "Navy"),
                    ListColor(color: Color("Purple"), label: "Purple"),
                    ListColor(color: Color("Yellow"), label: "Yellow"),
                    ListColor(color: Color("White"), label: "White"),
                    ListColor(color: Color("Orange"), label: "Orange")],
                   show: false
                  ),

        ColorModel(id: 2, title: "Grey",
                   listColor: [
                    ListColor(color: Color("Brown"), label: "Brown"),
                    ListColor(color: Color("Green"), label: "Green"),
                    ListColor(color: Color("Red"), label: "Red"),
                    ListColor(color: Color("Grey"), label: "Grey"),
                    ListColor(color: Color("Pink"), label: "Pink"),
                    ListColor(color: Color("Navy"), label: "Navy"),
                    ListColor(color: Color("White"), label: "White"),
                    ListColor(color: Color("Black"), label: "Black"),
                    ListColor(color: Color("Metallic Blue"), label: "Metallic Blue")],
                   show: false
                  ),

        ColorModel(id: 3, title: "Light Blue",
                   listColor: [
                    ListColor(color: Color("Brown"), label: "Brown"),
                    ListColor(color: Color("Green"), label: "Green"),
                    ListColor(color: Color("Dark Pink"), label: "Dark Pink"),
                    ListColor(color: Color("Purple"), label: "Purple"),
                    ListColor(color: Color("Grey"), label: "Grey"),
                    ListColor(color: Color("Beige"), label: "Beige"),
                    ListColor(color: Color("Pink"), label: "Pink"),
                    ListColor(color: Color("Red"), label: "Red"),
                    ListColor(color: Color("White"), label: "White"),
                    ListColor(color: Color("Black"), label: "Black"),
                    ListColor(color: Color("Orange"), label: "Orange"),
                    ListColor(color: Color("Navy"), label: "Navy")],
                   show: false
                  ),

        ColorModel(id: 4, title: "Pink",
                   listColor: [
                    ListColor(color: Color("Black"), label: "Black"),
                    ListColor(color: Color("Beige"), label: "Beige"),
                    ListColor(color: Color("Grey"), label: "Grey"),
                    ListColor(color: Color("Purple"), label: "Purple"),
                    ListColor(color: Color("Light Blue"), label: "Light Blue"),
                    ListColor(color: Color("Navy"), label: "Navy"),
                    ListColor(color: Color("White"), label: "White"),
                    ListColor(color: Color("Red"), label: "Red")],
                   show: false
                  ),

        ColorModel(id: 5, title: "Yellow",
                   listColor: [
                    ListColor(color: Color("Black"), label: "Black"),
                    ListColor(color: Color("Brown"), label: "Brown"),
                    ListColor(color: Color("Grey"), label: "Grey"),
                    ListColor(color: Color("Purple"), label: "Purple"),
                    ListColor(color: Color("Green2"), label: "Green"),
                    ListColor(color: Color("Navy"), label: "Navy"),
                    ListColor(color: Color("White"), label: "White"),
                    ListColor(color: Color("Beige"), label: "Beige")],
                   show: false
                  ),

        ColorModel(id: 6, title: "Orange",
                   listColor: [
                    ListColor(color: Color("White"), label: "White"),
                    ListColor(color: Color("Yellow"), label: "Yellow"),
                    ListColor(color: Color("Black"), label: "Black"),
                    ListColor(color: Color("Green"), label: "Green"),
                    ListColor(color: Color("Light Blue"), label: "Light Blue"),
                    ListColor(color: Color("Navy"), label: "Navy"),
                    ListColor(color: Color("Beige"), label: "Beige"),
                    ListColor(color: Color("Brown"), label: "Brown"),
                    ListColor(color: Color("Grey"), label: "Grey"),
                    ListColor(color: Color("Purple"), label: "Purple"),
                    ListColor(color: Color("Metallic Blue"), label: "Metallic Blue")],
                   show: false
                  ),

        ColorModel(id: 7, title: "Black",
                   listColor: [
                    ListColor(color: Color("White"), label: "White"),
                    ListColor(color: Color("Beige"), label: "Beige"),
                    ListColor(color: Color("Pink"), label: "Pink"),
                    ListColor(color: Color("Red"), label: "Red"),
                    ListColor(color: Color("Orange"), label: "Orange"),
                    ListColor(color: Color("Yellow"), label: "Yellow"),
                    ListColor(color: Color("Green"), label: "Green"),
                    ListColor(color: Color("Light Blue"), label: "Light Blue"),
                    ListColor(color: Color("Metallic Blue"), label: "Metallic Blue"),
                    ListColor(color: Color("Purple"), label: "Purple"),
                    ListColor(color: Color("Brown"), label: "Brown"),
                    ListColor(color: Color("Grey"), label: "Grey"),
                    ListColor(color: Color("Green2"), label: "Green")],
                   show: false
                  ),

        ColorModel(id: 8, title: "Brown",
                   listColor: [
                    ListColor(color: Color("White"), label: "White"),
                    ListColor(color: Color("Beige"), label: "Beige"),
                    ListColor(color: Color("Black"), label: "Black"),
                    ListColor(color: Color("Green"), label: "Green"),
                    ListColor(color: Color("Red"), label: "Red"),
                    ListColor(color: Color("Orange"), label: "Orange")],
                   show: false
                  ),

        ColorModel(id: 9, title: "Navy",
                   listColor: [
                    ListColor(color: Color("White"), label: "White"),
                    ListColor(color: Color("Beige"), label: "Beige"),
                    ListColor(color: Color("Yellow"), label: "Yellow"),
                    ListColor(color: Color("Green"), label: "Green"),
                    ListColor(color: Color("Dark Pink"), label: "Dark Pink"),
                    ListColor(color: Color("Pink"), label: "Pink"),
                    ListColor(color: Color("Red"), label: "Red"),
                    ListColor(color: Color("Grey"), label: "Grey"),
                    ListColor(color: Color("Black"), label: "Black"),
                    ListColor(color: Color("Light Blue"), label: "Light Blue"),
                    ListColor(color: Color("Purple"), label: "Purple"),
                    ListColor(color: Color("Orange"), label: "Orange"),
                    ListColor(color: Color("Metallic Blue"), label: "Metallic Blue")],
                   show: false
                  ),

        ColorModel(id: 10, title: "Green",
                   listColor: [
                    ListColor(color: Color("White"), label: "White"),
                    ListColor(color: Color("Beige"), label: "Beige"),
                    ListColor(color: Color("Light Blue"), label: "Light Blue"),
                    ListColor(color: Color("Yellow"), label: "Yellow"),
                    ListColor(color: Color("Purple"), label: "Purple"),
                    ListColor(color: Color("Black"), label: "Black"),
                    ListColor(color: Color("Orange"), label: "Orange"),
                    ListColor(color: Color("Brown"), label: "Brown"),
                    ListColor(color: Color("Metallic Blue"), label: "Metallic Blue")],
                   show: false
                  ),

        ColorModel(id: 11, title: "Red",
                   listColor: [
                    ListColor(color: Color("White"), label: "White"),
                    ListColor(color: Color("Beige"), label: "Beige"),
                    ListColor(color: Color("Light Blue"), label: "Light Blue"),
                    ListColor(color: Color("Purple"), label: "Purple"),
                    ListColor(color: Color("Black"), label: "Black"),
                    ListColor(color: Color("Brown"), label: "Brown"),
                    ListColor(color: Color("Navy"), label: "Navy"),
                    ListColor(color: Color("Grey"), label: "Grey"),
                    ListColor(color: Color("Pink"), label: "Pink"),
                    ListColor(color: Color("Metallic Blue"), label: "Metallic Blue")],
                   show: false
                  ),

        ColorModel(id: 12, title: "Purple",
                   listColor: [
                    ListColor(color: Color("White"), label: "White"),
                    ListColor(color: Color("Beige"), label: "Beige"),
                    ListColor(color: Color("Light Blue"), label: "Light Blue"),
                    ListColor(color: Color("Metallic Blue"), label: "Metallic Blue"),
                    ListColor(color: Color("Brown"), label: "Brown"),
                    ListColor(color: Color("Pink"), label: "Pink"),
                    ListColor(color: Color("Orange"), label: "Orange"),
                    ListColor(color: Color("Grey"), label: "Grey"),
                    ListColor(color: Color("Green2"), label: "Green"),
                    ListColor(color: Color("Black"), label: "Black"),
                    ListColor(color: Color("Navy"), label: "Navy")],
                   show: false
                  ),

        ColorModel(id: 13, title: "Blue",
                   listColor: [
                    ListColor(color: Color("Brown"), label: "Brown"),
                    ListColor(color: Color("Green"), label: "Green"),
                    ListColor(color: Color("Dark Pink"), label: "Dark Pink"),
                    ListColor(color: Color("Purple"), label: "Purple"),
                    ListColor(color: Color("Grey"), label: "Grey"),
                    ListColor(color: Color("Beige"), label: "Beige"),
                    ListColor(color: Color("Pink"), label: "Pink"),
                    ListColor(color: Color("Red"), label: "Red"),
                    ListColor(color: Color("White"), label: "White"),
                    ListColor(color: Color("Black"), label: "Black"),
                    ListColor(color: Color("Orange"), label: "Orange"),
                    ListColor(color: Color("Navy"), label: "Navy"),
                    ListColor(color: Color("Yellow"), label: "Yellow"),
                    ListColor(color: Color("Metallic Blue"), label: "Metallic Blue")],
                   show: false
                  )
        ]
}
