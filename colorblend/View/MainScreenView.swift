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
            ColorPickerView()
                .ignoresSafeArea()

        }
    }
}

struct Tab2View: View {
    var body: some View {
//        MainScreen2View()
        DetectorView()
            .ignoresSafeArea()

    }
}

struct MainScreenView: View {
    @StateObject var cameratest = ViewController()
    @StateObject var cameraSearch = DetectorController()


    var body: some View {
        NavigationStack{
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
                            .onAppear(){
                                if cameratest.captureSession.isRunning{
                                    cameratest.viewWillDisappear(true)
                                    cameraSearch.viewWillAppear(true)
                                }
                            }
                            .onTapGesture(){
                                cameratest.startSession()
                                cameraSearch.stopSession()
                            }
                        
                        Tab2View()
                            .tabItem{
                                Image(systemName: "magnifyingglass")
                                    .imageScale(.large)
                                    .foregroundColor(.white)
                                Text("Find Color")
                                    .font(Font.custom("SFProText-Bold", size: 14))
                                    .foregroundColor(.white)
                            }
                            .onAppear(){
                                if cameraSearch.captureSession.isRunning{
                                    cameraSearch.viewWillDisappear(true)
                                    cameratest.viewWillAppear(true)
                                }
                            }
                            .onTapGesture(){
                                cameraSearch.startSession()
                                cameratest.stopSession()
                            }
                        
                    }
//                    .foregroundColor(.white)
                    .onAppear(){
                        UITabBar.appearance().backgroundColor = .black
                        UITabBar.appearance().unselectedItemTintColor = .white
                    }
                    //                .tint(.black)
                }
                // MainScreen2View()
            }
            .background(.white)
        }
        
    }
}
