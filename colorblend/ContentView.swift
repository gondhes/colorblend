//
//  ContentView.swift
//  colorblend
//
//  Created by Fajar Wirazdi on 07/07/23.
//

import SwiftUI

struct ContentView: View {
    var colorModel = String()
    
    var body: some View {
        VStack {
//                        CameraView()
//            TestView()
//            CameraTestView()
//            Home()
            MainScreenView()
                .preferredColorScheme(.light)
            //            ColorRecommendationView()
//            SwiftUIView(colorChosen: colorData[5])
//            pickColor()
//            ContentssView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
