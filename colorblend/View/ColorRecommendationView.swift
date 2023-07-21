//
//  ColorRecommendationView.swift
//  colorblend
//
//  Created by Hafidz Ismail Hidayat on 10/07/23.
//

import SwiftUI

struct ColorRecommendationView: View {
    @State private var color = String()
    @State var colorName = String()
    @Binding var getColor: UIColor
    

    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Text("Testing Warna")
                        .foregroundColor(Color(uiColor: getColor))
                    TextField("Input Color", text: $colorName)
                        .foregroundColor(.black)
                        .background(Color(.red))
                        .padding(.horizontal)
                        .frame(width: 330, height: 32)
                        .overlay(RoundedRectangle(cornerRadius: 10) .stroke(Color.gray, lineWidth: 0))
                        .background(Color(.red))
                        .cornerRadius(10)
                    NavigationLink("Submit", destination: RecommendationView(colorName: $colorName))
                    }
                }
            }
        }
    }

//struct ColorRecommendationView_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorRecommendationView(getColor: .blue)
//    }
//}

struct RecommendationView: View {
    @Binding var colorName : String
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Text("Testing Warna")
                    Text("\(colorName)")
//                    TextField("Input Color", text: $colorName)
//                        .foregroundColor(.black)
//                        .background(Color(.red))
//                        .padding(.horizontal)
//                        .frame(width: 330, height: 32)
//                        .overlay(RoundedRectangle(cornerRadius: 10) .stroke(Color.gray, lineWidth: 0))
//                        .background(Color(.red))
//                        .cornerRadius(10)
                }
            }
        }
    }
}
