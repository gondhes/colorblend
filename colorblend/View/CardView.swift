//
//  CardView.swift
//  colorblend
//
//  Created by Hafidz Ismail Hidayat on 23/07/23.
//

import SwiftUI

struct CardView: View {
    var colorRecommendation: colorModel
    
    var body: some View{
        ZStack{
            HStack{
                ForEach(colorRecommendation.listColor, id: \.self){i in
//                    Text(i.title)
                    Image("Image 1")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(i.color)
                }
            }
        }
    }
}
