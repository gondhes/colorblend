//
//  ColorRecommendationView.swift
//  colorblend
//
//  Created by Hafidz Ismail Hidayat on 10/07/23.
//

import SwiftUI

struct ColorRecommendationView: View {
    @State private var color = String()
    @Binding var getColor: UIColor
    @Binding var getLabelColor: String
    @State private var showAlertColor = false
    @State private var isChoose = false
    @State var isUpper: Bool = false

    @State var colorRecommendation: [ColorModel] = ColorData().data

    func outfitView() -> some View {
        VStack (spacing: 5){
            ZStack{
                Rectangle()
                    .foregroundColor(Color(uiColor: getColor))
                    .frame(height: 168)
                Text(getLabelColor)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.top, 55)
            }
            if isUpper == true {
                ZStack{
                    Image("shirt 3")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .foregroundColor(Color(uiColor: getColor))
                        .shadow(radius: 4, x: 0, y: 2)
                }
                .frame(height: 257)
                .padding(.horizontal, 40)
                ZStack{
                    TabView{
                        ForEach(colorRecommendation) { code in
                            CardView(colorRecommendation: code, isUpper: $isUpper)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                }
                .frame(height: 344)
            } else {
                ZStack{
                    TabView{
                        ForEach(colorRecommendation) { code in
                            CardView(colorRecommendation: code, isUpper: $isUpper)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                }
                .frame(height: 257)
                
                ZStack{
                    VStack (spacing: 10){
                        Image("pants")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 110)
                            .foregroundColor(Color(uiColor: getColor))
                            .shadow(radius: 4, x: 0, y: 2)
                    }
                }
                .frame(height: 344)
            }
        }
    }
//
//    func lowerOutfitView () -> some View {
//        VStack (spacing: 5){
//            ZStack{
//                Rectangle()
//                    .foregroundColor(Color(uiColor: getColor))
//                    .frame(height: 168)
//                Text(getLabelColor)
//                    .font(.largeTitle)
//                    .foregroundColor(.white)
//                    .padding(.top, 55)
//            }
//            ZStack{
//                TabView{
//                    ForEach(colorRecommendation) { code in
//                        CardView(colorRecommendation: code, isUpper: $isUpper)
//                    }
//                }
//                .tabViewStyle(PageTabViewStyle())
//            }
//            .frame(height: 257)
//
//            ZStack{
//                VStack (spacing: 10){
//                    Image("pants")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 110)
//                        .foregroundColor(Color(uiColor: getColor))
//                        .shadow(radius: 4, x: 0, y: 2)
//                }
//            }
//            .frame(height: 344)
//        }
//    }
    

    var body: some View {
        NavigationView {
            ZStack {
                if isChoose == true {
                    if isUpper == true {
                        outfitView()
//                        VStack(spacing: 5) {
//                            ZStack {
//                                Rectangle()
//                                    .foregroundColor(Color(uiColor: getColor))
//                                    .frame(height: 168)
//                                Text(getLabelColor)
//                                    .font(.largeTitle)
//                                    .foregroundColor(.white)
//                                    .padding(.top, 55)
//                            }
//                            ZStack {
//                                Image("shirt 3")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 150)
//                                    .foregroundColor(Color(uiColor: getColor))
//                                    .shadow(radius: 4, x: 0, y: 2)
//                            }
//                            .frame(height: 257)
//                            .padding(.horizontal, 40)
//                            ZStack {
//                                TabView {
//                                    ForEach(colorRecommendation) { code in
//                                        CardView(colorRecommendation: code, isUpper: $isUpper)
//                                    }
//                                }
//                                .tabViewStyle(PageTabViewStyle())
//                            }
//                            .frame(height: 344)
//                        }
                    } else {
                        outfitView()
//                        VStack(spacing: 5) {
//                            ZStack {
//                                Rectangle()
//                                    .foregroundColor(Color(uiColor: getColor))
//                                    .frame(height: 168)
//                                Text(getLabelColor)
//                                    .font(.largeTitle)
//                                    .foregroundColor(.white)
//                                    .padding(.top, 55)
//                            }
//                            ZStack {
//                                TabView {
//                                    ForEach(colorRecommendation) { code in
//                                        CardView(colorRecommendation: code, isUpper: $isUpper)
//                                    }
//                                }
//                                .tabViewStyle(PageTabViewStyle())
//                            }
//                            .frame(height: 257)
//
//                            ZStack {
//                                VStack(spacing: 10) {
//                                    Image("pants")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: 110)
//                                        .foregroundColor(Color(uiColor: getColor))
//                                        .shadow(radius: 4, x: 0, y: 2)
//                                }
//                            }
//                            .frame(height: 344)
//                        }
                    }
                } else {
                    EmptyView()
                }
            }
            .ignoresSafeArea()
            .background(.white)

            .alert("Your \(getLabelColor) color is for", isPresented: $showAlertColor) {
                Button("Upper Outfit") {
                    isChoose = true
                    isUpper = true
                }
                Button("Lower Outfit") {
                    isChoose = true
                    isUpper = false
                }
            }
            .onAppear {
                showAlertColor = true
                setupAppearance()
                colorRecommendation = colorRecommendation.filter {$0.title == getLabelColor}
            }
            .onChange(of: getLabelColor) { newValue in
                colorRecommendation = colorRecommendation.filter {$0.title == newValue}
            }
        }
    }
}

func setupAppearance() {
    UIPageControl.appearance().currentPageIndicatorTintColor = .black
    UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
}

func getComplementaryForColor(color: UIColor) -> UIColor {

    let ciColor = CIColor(color: color)

    // get the current values and make the difference from white:
    let compRed: CGFloat = 1.0 - ciColor.red
    let compGreen: CGFloat = 1.0 - ciColor.green
    let compBlue: CGFloat = 1.0 - ciColor.blue

    return UIColor(red: compRed, green: compGreen, blue: compBlue, alpha: 1.0)
}

func getTriadColor(color: UIColor) -> (UIColor, UIColor) {

    var hue: CGFloat = 0.0
    var saturation: CGFloat = 0.0
    var brightness: CGFloat = 0.0
    var alpha: CGFloat = 0.0

    let triadHue = color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) ? 1.0 : 0.0
    //    let triadHue = CGFloat(color.get)

    let triadColor1 = UIColor(hue: (triadHue + 0.33) - 1.0,
                              saturation: saturation,
                              brightness: brightness,
                              alpha: alpha)
    let triadColor2 = UIColor(hue: (triadHue + 0.66) - 1.0,
                              saturation: saturation,
                              brightness: brightness,
                              alpha: alpha)

    return (triadColor1, triadColor2)

}

func getTetradColors(for color: UIColor) -> [UIColor] {
    var hue: CGFloat = 0
    var saturation: CGFloat = 0
    var brightness: CGFloat = 0
    var alpha: CGFloat = 0

    let tetradHue = color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) ? 1.0 : 0.0

    let tetradColor1 = UIColor(hue: (tetradHue + 0.25) - 1.0,
                               saturation: saturation,
                               brightness: brightness,
                               alpha: alpha)
    let tetradColor2 = UIColor(hue: (tetradHue + 0.5) - 1.0,
                               saturation: saturation,
                               brightness: brightness,
                               alpha: alpha)
    let tetradColor3 = UIColor(hue: (tetradHue + 0.75) - 1.0,
                               saturation: saturation,
                               brightness: brightness,
                               alpha: alpha)

    return [tetradColor1, tetradColor2, tetradColor3]
}
