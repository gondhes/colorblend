//
//  OnboardingView.swift
//  colorblend
//
//  Created by Hafidz Ismail Hidayat on 27/07/23.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    @State var activeScreen: Int = 0
    @State var onboarding: [Onboarding] = onboardingData
    var body: some View {
        ZStack{
            TabView(selection: $activeScreen){
                ForEach(0..<onboarding.count) { onboard in
                    OnboardingCard(onboarding: onboarding[onboard], activeScreen: $activeScreen, maxIndex: onboarding.count-1).tag(onboard)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .navigationDestination(isPresented: $isOnboarding) {
                MainScreenView()
            }
        }
        .ignoresSafeArea()
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button("Skip"){}
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
