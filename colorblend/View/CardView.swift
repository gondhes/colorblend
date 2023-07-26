//
//  CardView.swift
//  colorblend
//
//  Created by Hafidz Ismail Hidayat on 23/07/23.
//

import SwiftUI

struct CardView: View {
    var colorRecommendation: colorModel
    @State private var imageCard: String = ""
    @Binding var isUpper: Bool
    
    var body: some View{
        ZStack{
            TabView{
                ForEach(colorRecommendation.listColor, id: \.self){i in
                    ZStack(alignment: .top){
                        VStack(spacing: 10){
                            Text(i.label)
                            Image(imageCard)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 140)
                                .foregroundColor(i.color)
                                .shadow(radius: 4, x: 0, y: 2)
                        }
                        .padding(.vertical, 20)
                    }
                    .padding(.horizontal, 40)
                }
                .tabViewStyle(.page)
            }
        }.onAppear(){
            if isUpper == true {
                imageCard = "pants"
            } else {
                imageCard = "shirt 3"
            }
        }
    }
}


