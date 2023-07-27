//
//  colorblendApp.swift
//  colorblend
//
//  Created by Fajar Wirazdi on 07/07/23.
//

import SwiftUI

@main
struct colorblendApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true


    var body: some Scene {
        WindowGroup {
            if isOnboarding{
                SplashView()
                OnboardingView()
            } else{
                ContentView()
            }
        }
    }
}
