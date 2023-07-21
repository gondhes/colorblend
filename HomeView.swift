//
//  HomeView.swift
//  colorblend
//
//  Created by Hafidz Ismail Hidayat on 11/07/23.
//

import SwiftUI

struct HomeView: View {
    @State var showPicker: Bool = true
    @State var selectedColor: Color = .white
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(selectedColor)
                .ignoresSafeArea()
            CameraTestView()
        }
//        .CustomColorPicker(showPicker: $showPicker, color: $selectedColor)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
