//
//  DetectorView.swift
//  colorblend
//
//  Created by Hafidz Ismail Hidayat on 26/07/23.
//

import SwiftUI

struct DetectorView: View {
    @StateObject var cameraSearch = DetectorController()
    var colors = ["blue", "red", "yellow", "green", "purple", "pink"]

    
    var body: some View {
        ZStack{
            HostedViewController(cameraSearch: cameraSearch)
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color(wordName: "\(cameraSearch.colorPicked)")!)
                        .frame(height: 150)
                        .frame(maxWidth: .infinity)
                    Text("\(cameraSearch.colorPicked.capitalized)")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.top, 70)
                }
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: UIScreen.main.bounds.size.width-18, height: 32)
                        .foregroundColor(Color(wordName: "\(cameraSearch.colorPicked)")!)
                        .padding(.bottom, 75)
                        .opacity(0.5)
                    
                    Picker("Color", selection: $cameraSearch.colorPicked) {
                        ForEach(colors, id: \.self) {
                            Text($0.capitalized).tag($0)
                                .foregroundColor(.white)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(height: 125)
                    .padding(.bottom, 75)
                }
                
            }
        }
        .ignoresSafeArea()
    }
}

extension Color {
    
    init?(wordName: String) {
        switch wordName {
        case "clear":       self = .clear
        case "black":       self = .black
        case "white":       self = .white
        case "gray":        self = .gray
        case "red":         self = .red
        case "green":       self = .green
        case "blue":        self = .blue
        case "orange":      self = .orange
        case "yellow":      self = .yellow
        case "pink":        self = .pink
        case "purple":      self = .purple
        case "primary":     self = .primary
        case "secondary":   self = .secondary
        default:            return nil
        }
    }
}
