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
    
    @State var colorRecommendation: [colorModel] = colorData().data
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white)
                            .shadow(radius: 4, x: 0, y: 0)
                        VStack{
                            Text(getLabelColor)
                            Image("shirt 3")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color(uiColor: getColor))
                                .shadow(radius: 4, x: 0, y: 2)
                        }
                        .padding(.vertical)
                    }
                    .frame(width: 300, height: 284)
                    .padding(.horizontal, 40)
                    TabView{
                        ForEach(colorRecommendation) { code in
                            CardView(colorRecommendation: code)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .automatic))
                }
            }
            .onAppear {
                colorRecommendation = colorRecommendation.filter {$0.title == getLabelColor}
            }
            .onChange(of: getLabelColor) { newValue in
                colorRecommendation = colorRecommendation.filter {$0.title == newValue}
            }
        }
        .navigationTitle("Color Recommendation for \(getLabelColor)")
    }
}

func getComplementaryForColor(color: UIColor) -> UIColor {
    
    let ciColor = CIColor(color: color)
    
    // get the current values and make the difference from white:
    let compRed: CGFloat = 1.0 - ciColor.red
    let compGreen: CGFloat = 1.0 - ciColor.green
    let compBlue: CGFloat = 1.0 - ciColor.blue
    
    return UIColor(red: compRed, green: compGreen, blue: compBlue, alpha: 1.0)
}

func getTriadColor(color: UIColor) -> (UIColor, UIColor){

    var hue : CGFloat = 0.0
    var saturation : CGFloat = 0.0
    var brightness : CGFloat = 0.0
    var alpha : CGFloat = 0.0

    let triadHue = color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) ? 1.0 : 0.0
//    let triadHue = CGFloat(color.get)

    let triadColor1 = UIColor(hue: (triadHue + 0.33) - 1.0, saturation: saturation, brightness: brightness, alpha: alpha)
    let triadColor2 = UIColor(hue: (triadHue + 0.66) - 1.0, saturation: saturation, brightness: brightness, alpha: alpha)


    return (triadColor1, triadColor2)

}

func getTetradColor(color: UIColor) -> (UIColor, UIColor, UIColor){

    var hue : CGFloat = 0
    var saturation : CGFloat = 0
    var brightness : CGFloat = 0
    var alpha : CGFloat = 0

//    let tetradHue = CGFloat(color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha))
    let tetradHue = color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) ? 1.0 : 0.0


    let tetradColor1 = UIColor(hue: (tetradHue + 0.25) - 1.0, saturation: saturation, brightness: brightness, alpha: alpha)
    let tetradColor2 = UIColor(hue: (tetradHue + 0.5) - 1.0, saturation: saturation, brightness: brightness, alpha: alpha)
    let tetradColor3 = UIColor(hue: (tetradHue + 0.75) - 1.0, saturation: saturation, brightness: brightness, alpha: alpha)

    return (tetradColor1, tetradColor2, tetradColor3)
}
