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
                            if isUpper == false {
                                Text(i.label)
                                    .font(.title3)
                                    .foregroundColor(.black)
                                Image(imageCard)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 140)
                                    .foregroundColor(i.color)
                                    .shadow(radius: 4, x: 0, y: 2)
                            } else{
                                Image(imageCard)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 140)
                                    .foregroundColor(i.color)
                                    .shadow(radius: 4, x: 0, y: 2)
                                Text(i.label)
                                    .font(.title3)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .padding(.bottom, 40)
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


