//
//  SplashView.swift
//  colorblend
//
//  Created by Hafidz Ismail Hidayat on 27/07/23.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack{
            Image("Logo Colorblend")
                .resizable()
                .scaledToFit()
                .frame(width: 180)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
