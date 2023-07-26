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
            TabView{
                ForEach(colorRecommendation.listColor, id: \.self){i in
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white)
                            .shadow(radius: 4, x: 0, y: 0)
                        VStack{
                            Image("Image 2")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(i.color)
                                .shadow(radius: 4, x: 0, y: 2)
                            Text(i.label)
                        }
                        .padding(.vertical)
                    }
                    .frame(width: 300, height: 284)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 20)
                }
                .tabViewStyle(.page)
            }
        }
    }
}
