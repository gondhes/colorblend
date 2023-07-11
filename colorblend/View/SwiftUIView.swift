//
//  SwiftUIView.swift
//  colorblend
//
//  Created by Hafidz Ismail Hidayat on 10/07/23.
//

import SwiftUI

struct SwiftUIView: View {
    var colorChosen: colorModel
    var body: some View {
        ZStack{
            VStack{
                Text("Color Chosen")
                    .font(.largeTitle)
                Text(colorChosen.title)
                Rectangle()
                    .frame(width: 200, height: 200)
                    .foregroundColor(colorChosen.color0)
                Text("Recommendation Color")
                    .font(.title3)
                HStack{
                    Rectangle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(colorChosen.color1)
                    Rectangle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(colorChosen.color2)
                    Rectangle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(colorChosen.color3)
                    Rectangle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(colorChosen.color4)
                    Rectangle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(colorChosen.color5)
                    Rectangle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(colorChosen.color6)
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(colorChosen: colorData[5])
    }
}

struct testing: View{
    @State var colorcode : [String] = ["white","beige","grey","sky blue","pink","yellow","orange","black","brown","navy","green","red","purple"]
    @State var code = String()
    var body: some View{
        ZStack{
            TextField("Chose Color", text: $code)
                .foregroundColor(.black)
                .background(Color(.red))
                .padding(.horizontal)
                .frame(width: 330, height: 32)
                .overlay(RoundedRectangle(cornerRadius: 10) .stroke(Color.gray, lineWidth: 0))
                .background(Color(.red))
                .cornerRadius(10)
        }
    }
}

let colorNumbers: [String:Int] = [
    "white" : 0,
    "beige" : 1,
    "grey" : 2,
    "sky blue" : 3,
    "pink" : 4,
    "yellow" : 5,
    "orange" : 6,
    "black" : 7,
    "brown" : 8,
    "navy" : 9,
    "green" : 10,
    "red" : 11,
    "purple" : 12
]
