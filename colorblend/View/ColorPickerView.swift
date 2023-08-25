//
//  ColorPickerView.swift
//  colorblend
//
//  Created by Hafidz Ismail Hidayat on 20/07/23.
//

import SwiftUI
import AVFoundation

struct ColorPickerView: View {
    @StateObject var cameratest = ViewController()
    @State private var showWelcomeView = false
    @State var identifier: UIColor = UIColor.black
    @State var getColor: UIColor = UIColor.black
    @State var toggleFlashisOn = false
    @State var cameraPositionBack = true
    @State var identifierLabel: String = ""
    @State var getLabelColor: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                CameraTestPreview(cameratest: cameratest, identifier: $identifier, identifierLabel: $identifierLabel)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    ZStack(alignment: .leading) {
                        HStack(alignment: .center) {
                            // Flash Button
                            Button(action: {
                                toggleFlashisOn.toggle()
                                if toggleFlashisOn == true {
                                    cameratest.toggleTorch(active: true)
                                } else {
                                    cameratest.toggleTorch(active: false)
                                }
                            }, label: {
                                if toggleFlashisOn {
                                    Image(systemName: "bolt.circle.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.yellow)
                                } else {
                                    Image(systemName: "bolt.circle")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.white)
                                }
                            })
                            
                            if !cameratest.isTaken {
                                Button(action: {
                                    getColor = identifier
                                    getLabelColor = identifierLabel
                                    cameratest.toggleTorch(active: false)
                                    showWelcomeView = true
                                    if cameratest.captureSession.isRunning {
                                        cameratest.captureSession.stopRunning()
                                    }
                                }

                                       , label: {
                                    ZStack {
                                        Circle()
                                            .fill(Color.white)
                                            .frame(width: 65, height: 65, alignment: .center)
                                        Circle()
                                            .stroke(Color.white, lineWidth: 2)
                                            .frame(width: 75, height: 75, alignment: .center)
                                    }
                                    .padding(.horizontal, 60)
                                    .navigationDestination(isPresented: $showWelcomeView) {
                                        ColorRecommendationView(getColor: $getColor,
                                                                getLabelColor: $getLabelColor)
                                    }
                                    //                                    NavigationLink("",
                                    //                                destination: ColorRecommendationView(getColor: $getColor,
                                    //                                                                     getLabelColor: $getLabelColor),
                                    //                                isActive: $showWelcomeView)
                                })
                            } else {
                                EmptyView()
                            }
                        }
                    }
                    .padding(.bottom, 20)
                    .padding(.horizontal, 20)
                    .padding(.trailing, 25)
                }
                Image(systemName: "scope")
                    .resizable()
                    .frame(width: 56, height: 56)
                    .foregroundColor(.yellow)
                    .offset(x: 0, y: 18)
            }
            .onAppear {
                toggleFlashisOn = false
            }
        }
    }
}
