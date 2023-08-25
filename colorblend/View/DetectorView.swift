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
        ZStack {
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
        let colorMapping: [String: Color] = [
            "clear": .clear, "black": .black, "white": .white,
            "gray": .gray, "red": .red, "green": .green,
            "blue": .blue, "orange": .orange, "yellow": .yellow,
            "pink": .pink, "purple": .purple,
            "primary": .primary, "secondary": .secondary
        ]

        guard let color = colorMapping[wordName] else {
            return nil
        }

        self = color
    }
}
