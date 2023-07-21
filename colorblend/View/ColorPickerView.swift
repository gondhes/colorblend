//
//  ColorPickerView.swift
//  colorblend
//
//  Created by Hafidz Ismail Hidayat on 20/07/23.
//

import SwiftUI
import AVFoundation

struct CameraTestView: View{
    @StateObject var cameratest = ViewController()
    @State private var showWelcomeView = false
    @State var identifier: UIColor = UIColor.black
    @State var getColor: UIColor = UIColor.black
    @State var toggleFlashisOn = false
    @State var cameraPosition = false
    
    var body: some View{
        NavigationView{
            ZStack{
                CameraTestPreview(cameratest: cameratest, identifier: $identifier)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    HStack{
                        //Flash Button
                        Button(action: {
                            toggleFlashisOn.toggle()
                            if toggleFlashisOn{
                                cameratest.toggleTorch(on: true)
                            } else{
                                cameratest.toggleTorch(on: false)
                            }
                        }, label: {
                            if toggleFlashisOn{
                                Image(systemName: "bolt.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            } else{
                                Image(systemName: "bolt.circle")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                        })
                                                
                        
                        if !cameratest.isTaken {
                            Button(action: {
                                showWelcomeView = true
                                print("Pindah")
                                getColor = identifier
                                print("COLOR: ", identifier)
                            }, label: {
                                ZStack {
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 65, height: 65, alignment: .center)
                                    Circle()
                                        .stroke(Color.white, lineWidth: 2)
                                        .frame(width: 75, height: 75, alignment: .center)
                                }
                                .padding(.bottom, 20)
                                NavigationLink("", destination: ColorRecommendationView(getColor: $getColor), isActive: $showWelcomeView)
                            })
                        } else {
                            EmptyView()
                        }
                        
                        Button(action: {
                            cameraPosition.toggle()
                            if cameraPosition == true{
                                Text("I Love You")
//                                cameratest.switchButtonTapped()
                                
                            } else{
                                
//                                cameratest.switchCamera()

                            }
                        }, label: {
                            if cameraPosition{
                                Image(systemName: "camera.rotate.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            } else{
                                Image(systemName: "camera.rotate")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                        })
//
                    }
                }
            }
        }
    }
}
