//
//  ColorData.swift
//  colorblend
//
//  Created by Hafidz Ismail Hidayat on 10/07/23.
//

import Foundation
import SwiftUI
//Marks - Color Data

class colorData {
    var data = [
        colorModel(title: "White",
                   listColor: [ListColor(color: Color("Black"), label: "Black"),ListColor(color: Color("Pink"), label: "Pink"), ListColor(color: Color("Red"), label: "Red"), ListColor(color: Color("Orange"), label: "Orange"), ListColor(color: Color("Beige"), label: "Beige"), ListColor(color: Color("Yellow"), label: "Yellow"), ListColor(color: Color("Green"), label: "Green"), ListColor(color: Color("Light Blue"), label: "Light Blue"), ListColor(color: Color("Navy"), label: "Navy"), ListColor(color: Color("Purple"), label: "Purple"), ListColor(color: Color("Brown"), label: "Brown"), ListColor(color: Color("Grey"), label: "Grey"), ListColor(color: Color("Green2"), label: "Green")]
//                   listLabel: [ListLabel(label: "Black"), ListLabel(label: "Pink"), ListLabel(label: "Red"), ListLabel(label: "Orange"), ListLabel(label: "Beige"), ListLabel(label: "Yellow"), ListLabel(label: "Green"), ListLabel(label: "Light Blue"), ListLabel(label: "Navy"), ListLabel(label: "Purple"), ListLabel(label: "Brown"), ListLabel(label: "Grey")]
                  ),
        
        colorModel(title: "Beige",
                   listColor: [ListColor(color: Color("Black"), label: "Black"), ListColor(color: Color("Brown"), label: "Brown"), ListColor(color: Color("Red"), label: "Red"), ListColor(color: Color("Green"), label: "Green"), ListColor(color: Color("Navy"), label: "Navy"), ListColor(color: Color("Purple"), label: "Purple"), ListColor(color: Color("Yellow"), label: "Yellow"), ListColor(color: Color("White"), label: "White"), ListColor(color: Color("Orange"), label: "Orange")]
//                   listLabel: [ListLabel(label: "Black"), ListLabel(label: "Brown"), ListLabel(label: "Red"), ListLabel(label: "Green"), ListLabel(label: "Navy"), ListLabel(label: "Purple"), ListLabel(label: "Yellow"), ListLabel(label: "White"), ListLabel(label: "Orange")]
                  ),
        
        colorModel(title: "Grey",
                   listColor: [ListColor(color: Color("Brown"), label: "Brown"), ListColor(color: Color("Green"), label: "Green"), ListColor(color: Color("Red"), label: "Red"), ListColor(color: Color("Grey"), label: "Grey"), ListColor(color: Color("Pink"), label: "Pink"), ListColor(color: Color("Navy"), label: "Navy"), ListColor(color: Color("White"), label: "White"), ListColor(color: Color("Black"), label: "Black"), ListColor(color: Color("Metallic Blue"), label: "Metallic Blue")]
//                   listLabel: [ListLabel(label: "Brown"), ListLabel(label: "Green"), ListLabel(label: "Red"), ListLabel(label: "Grey"), ListLabel(label: "Pink"), ListLabel(label: "Navy"), ListLabel(label: "White"), ListLabel(label: "Black"), ListLabel(label: "Metallic Blue")]
                  ),
        
        colorModel(title: "Light Blue",
                   listColor: [ListColor(color: Color("Brown"), label: "Brown"), ListColor(color: Color("Green"), label: "Green"), ListColor(color: Color("Dark Pink"), label: "Dark Pink"), ListColor(color: Color("Purple"), label: "Purple"), ListColor(color: Color("Grey"), label: "Grey"), ListColor(color: Color("Beige"), label: "Beige"), ListColor(color: Color("Pink"), label: "Pink"), ListColor(color: Color("Red"), label: "Red"), ListColor(color: Color("White"), label: "White"), ListColor(color: Color("Black"), label: "Black"), ListColor(color: Color("Orange"), label: "Orange"), ListColor(color: Color("Navy"), label: "Navy")]
//                   listLabel: [ListLabel(label: "Brown"), ListLabel(label: "Green"), ListLabel(label: "Dark Pink"), ListLabel(label: "Purple"), ListLabel(label: "Grey"), ListLabel(label: "Beige"), ListLabel(label: "Pink"), ListLabel(label: "Red"), ListLabel(label: "White"), ListLabel(label: "Black"), ListLabel(label: "Orange"), ListLabel(label: "Navy")]
                  ),
        
        colorModel(title: "Pink",
                   listColor: [ListColor(color: Color("Black"), label: "Black"), ListColor(color: Color("Beige"), label: "Beige"), ListColor(color: Color("Grey"), label: "Grey"), ListColor(color: Color("Purple"), label: "Purple"), ListColor(color: Color("Light Blue"), label: "Light Blue"), ListColor(color: Color("Navy"), label: "Navy"), ListColor(color: Color("White"), label: "White"), ListColor(color: Color("Red"), label: "Red")]
//                   listLabel: [ListLabel(label: "Black"), ListLabel(label: "Beige"), ListLabel(label: "Grey"), ListLabel(label: "Purple"), ListLabel(label: "Light Blue"), ListLabel(label: "Navy"), ListLabel(label: "White"), ListLabel(label: "Red")]
                  ),
        
        colorModel(title: "Yellow",
                   listColor: [ListColor(color: Color("Black"), label: "Black"), ListColor(color: Color("Brown"), label: "Brown"), ListColor(color: Color("Grey"), label: "Grey"), ListColor(color: Color("Purple"), label: "Purple"), ListColor(color: Color("Green2"), label: "Green"), ListColor(color: Color("Navy"), label: "Navy"), ListColor(color: Color("White"), label: "White"), ListColor(color: Color("Beige"), label: "Beige")]
//                   listLabel: [ListLabel(label: "Black"), ListLabel(label: "Brown"), ListLabel(label: "Grey"), ListLabel(label: "Purple"), ListLabel(label: "Green"), ListLabel(label: "Navy"), ListLabel(label: "White"), ListLabel(label: "Beige")]
                  ),
        
        colorModel(title: "Orange",
                   listColor: [ListColor(color: Color("White"), label: "White"), ListColor(color: Color("Yellow"), label: "Yellow"), ListColor(color: Color("Black"), label: "Black"), ListColor(color: Color("Green"), label: "Green"), ListColor(color: Color("Light Blue"), label: "Light Blue"), ListColor(color: Color("Navy"), label: "Navy"), ListColor(color: Color("Beige"), label: "Beige"), ListColor(color: Color("Brown"), label: "Brown"), ListColor(color: Color("Grey"), label: "Grey"), ListColor(color: Color("Purple"), label: "Purple"), ListColor(color: Color("Metallic Blue"), label: "Metallic Blue")]
//                   listLabel: [ListLabel(label: "White"), ListLabel(label: "Yellow"), ListLabel(label: "Black"), ListLabel(label: "Green"), ListLabel(label: "Light Blue"), ListLabel(label: "Navy"), ListLabel(label: "Beige"), ListLabel(label: "Brown"), ListLabel(label: "Grey"), ListLabel(label: "Purple"), ListLabel(label: "Metallic Blue")]
                  ),
        
        colorModel(title: "Black",
                   listColor: [ListColor(color: Color("White"), label: "White"), ListColor(color: Color("Beige"), label: "Beige"), ListColor(color: Color("Pink"), label: "Pink"), ListColor(color: Color("Red"), label: "Red"), ListColor(color: Color("Orange"), label: "Orange"), ListColor(color: Color("Yellow"), label: "Yellow"), ListColor(color: Color("Green"), label: "Green"), ListColor(color: Color("Light Blue"), label: "Light Blue"), ListColor(color: Color("Metallic Blue"), label: "Metallic Blue"), ListColor(color: Color("Purple"), label: "Purple"), ListColor(color: Color("Brown"), label: "Brown"), ListColor(color: Color("Grey"), label: "Grey"), ListColor(color: Color("Green2"), label: "Green")]
//                   listLabel: [ListLabel(label: "White"), ListLabel(label: "Beige"), ListLabel(label: "Pink"), ListLabel(label: "Red"), ListLabel(label: "Orange"), ListLabel(label: "Yellow"), ListLabel(label: "Green"), ListLabel(label: "Light Blue"), ListLabel(label: "Metallic Blue"), ListLabel(label: "Purple"), ListLabel(label: "Brown"), ListLabel(label: "Grey")]
                  ),
        
        colorModel(title: "Brown",
                   listColor: [ListColor(color: Color("White"), label: "White"), ListColor(color: Color("Beige"), label: "Beige"), ListColor(color: Color("Black"), label: "Black"), ListColor(color: Color("Green"), label: "Green"), ListColor(color: Color("Red"), label: "Red"), ListColor(color: Color("Orange"), label: "Orange")]
//                   listLabel: [ListLabel(label: "White"), ListLabel(label: "Beige"), ListLabel(label: "Black"), ListLabel(label: "Green"), ListLabel(label: "Red"), ListLabel(label: "Orange")]
                  ),
        
        colorModel(title: "Navy",
                   listColor: [ListColor(color: Color("White"), label: "White"), ListColor(color: Color("Beige"), label: "Beige"), ListColor(color: Color("Yellow"), label: "Yellow"), ListColor(color: Color("Green"), label: "Green"), ListColor(color: Color("Dark Pink"), label: "Dark Pink"), ListColor(color: Color("Pink"), label: "Pink"), ListColor(color: Color("Red"), label: "Red"), ListColor(color: Color("Grey"), label: "Grey"), ListColor(color: Color("Black"), label: "Black"), ListColor(color: Color("Light Blue"), label: "Light Blue"), ListColor(color: Color("Purple"), label: "Purple"), ListColor(color: Color("Orange"), label: "Orange"), ListColor(color: Color("Metallic Blue"), label: "Metallic Blue")]
//                   listLabel: [ListLabel(label: "White"), ListLabel(label: "Beige"), ListLabel(label: "Yellow"), ListLabel(label: "Green"), ListLabel(label: "Dark Pink"), ListLabel(label: "Pink"), ListLabel(label: "Red"), ListLabel(label: "Grey"), ListLabel(label: "Black"), ListLabel(label: "Light Blue"), ListLabel(label: "Purple"), ListLabel(label: "Orange"), ListLabel(label: "Metallic Blue")]
                  ),
        
        colorModel(title: "Green",
                   listColor: [ListColor(color: Color("White"), label: "Green"), ListColor(color: Color("Beige"), label: "Beige"), ListColor(color: Color("Light Blue"), label: "Light Blue"), ListColor(color: Color("Yellow"), label: "Yellow"), ListColor(color: Color("Purple"), label: "Purple"), ListColor(color: Color("Black"), label: "Black"), ListColor(color: Color("Orange"), label: "Orange"), ListColor(color: Color("Brown"), label: "Brown"), ListColor(color: Color("Metallic Blue"), label: "Metallic Blue")]
//                   listLabel: [ListLabel(label: "White"), ListLabel(label: "Beige"), ListLabel(label: "Light Blue"), ListLabel(label: "Yellow"), ListLabel(label: "Purple"), ListLabel(label: "Black"), ListLabel(label: "Orange"), ListLabel(label: "Brown"), ListLabel(label: "Metallic Blue")]
                  ),
        
        colorModel(title: "Red",
                   listColor: [ListColor(color: Color("White"), label: "White"), ListColor(color: Color("Beige"), label: "Beige"), ListColor(color: Color("Light Blue"), label: "Light Blue"), ListColor(color: Color("Purple"), label: "Purple"), ListColor(color: Color("Black"), label: "Black"), ListColor(color: Color("Brown"), label: "Brown"), ListColor(color: Color("Navy"), label: "Navy"), ListColor(color: Color("Grey"), label: "Grey"), ListColor(color: Color("Pink"), label: "Pink"), ListColor(color: Color("Metallic Blue"), label: "Metallic Blue")]
//                   listLabel: [ListLabel(label: "White"), ListLabel(label: "Beige"), ListLabel(label: "Light Blue"), ListLabel(label: "Purple"), ListLabel(label: "Black"), ListLabel(label: "Brown"), ListLabel(label: "Navy"), ListLabel(label: "Grey"), ListLabel(label: "Pink"), ListLabel(label: "Metallic Blue")]
                  ),
        
        colorModel(title: "Purple",
                   listColor: [ListColor(color: Color("White"), label: "White"), ListColor(color: Color("Beige"), label: "Beige"), ListColor(color: Color("Light Blue"), label: "Light Blue"), ListColor(color: Color("Metallic Blue"), label: "Metallic Blue"), ListColor(color: Color("Brown"), label: "Brown"), ListColor(color: Color("Pink"), label: "Pink"), ListColor(color: Color("Orange"), label: "Orange"), ListColor(color: Color("Grey"), label: "Grey"), ListColor(color: Color("Green2"), label: "Green"), ListColor(color: Color("Black"), label: "Black"), ListColor(color: Color("Navy"), label: "Navy")]
//                   listLabel: [ListLabel(label: "White"), ListLabel(label: "Beige"), ListLabel(label: "Light Blue"), ListLabel(label: "Metallic Blue"), ListLabel(label: "Brown"), ListLabel(label: "Pink"), ListLabel(label: "Orange"), ListLabel(label: "Grey"), ListLabel(label: "Green"), ListLabel(label: "Black"), ListLabel(label: "Navy")]
                  ),
        
        colorModel(title: "Blue",
                   listColor: [ListColor(color: Color("Brown"), label: "Brown"), ListColor(color: Color("Green"), label: "Green"), ListColor(color: Color("Dark Pink"), label: "Dark Pink"), ListColor(color: Color("Purple"), label: "Purple"), ListColor(color: Color("Grey"), label: "Grey"), ListColor(color: Color("Beige"), label: "Beige"), ListColor(color: Color("Pink"), label: "Pink"), ListColor(color: Color("Red"), label: "Red"), ListColor(color: Color("White"), label: "White"), ListColor(color: Color("Black"), label: "Black"), ListColor(color: Color("Orange"), label: "Orange"), ListColor(color: Color("Navy"), label: "Navy"), ListColor(color: Color("Yellow"), label: "Yellow"), ListColor(color: Color("Metallic Blue"), label: "Metallic Blue")]
//                   listLabel: [ListLabel(label: "Brown"), ListLabel(label: "Green"), ListLabel(label: "Dark Pink"), ListLabel(label: "Purple"), ListLabel(label: "Grey"), ListLabel(label: "Beige"), ListLabel(label: "Pink"), ListLabel(label: "Red"), ListLabel(label: "White"), ListLabel(label: "Black"), ListLabel(label: "Orange"), ListLabel(label: "Navy"), ListLabel(label: "Yellow"), ListLabel(label: "Metallic Blue")]
                  )
        ]
}
