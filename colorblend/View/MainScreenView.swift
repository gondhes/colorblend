//
//  MainScreenView.swift
//  colorblend
//
//  Created by Hafidz Ismail Hidayat on 20/07/23.
//

import SwiftUI

struct Tab1View: View {
    @StateObject var cameratest = ViewController()
    @State private var showWelcomeView = false
    @State var identifier: UIColor = UIColor.black
    @State var getColor: UIColor = UIColor.black

    var body: some View {
//        VStack(spacing: 0){
            ZStack{
                CameraTestView()
                //                    .ignoresSafeArea()
//                Rectangle()
//                    .fill(Color(red: 0.475, green: 0.718, blue: 0.808))
//                    .frame(maxWidth: .infinity)
//                //                                        .frame(height: 140)
//                //                    .frame(maxHeight: .infinity)
//                    .ignoresSafeArea()
//                //                    .foregroundColor(.blue)
//
//                Text("Blue")
//                    .font(Font.custom("SFProText-SemiBold", size: 36))
//                    .foregroundColor(.white)
//                //                    .padding(.top,-40)
            }
            
//                .frame(maxWidth: .infinity)
//                .frame(height: 625)
            //                .frame(maxHeight: .infinity) // Adjust the size as needed
//        }
    }
}

struct Tab2View: View {
    var body: some View {
        Text("Hello World")
//        MainScreen2View()
    }
}

struct MainScreenView: View {
    var body: some View {
        ZStack{
            HStack{
                TabView {
                    Tab1View()
                        .tabItem{
                            Image(systemName: "scope")
                                .imageScale(.large)
                            Text("Detect Color")
                                .font(Font.custom("SFProText-Bold", size: 14))
                        }
                    
                    Tab2View()
                        .tabItem{
                            Image(systemName: "magnifyingglass")
                                .imageScale(.large)
                            Text("Find Color")
                                .font(Font.custom("SFProText-Bold", size: 14))
                        }
                }
                .onAppear(){
                    UITabBar.appearance().backgroundColor = .systemBackground
                }
//                .tint(.black)

            }
            // MainScreen2View()
        }
        
    }
}
