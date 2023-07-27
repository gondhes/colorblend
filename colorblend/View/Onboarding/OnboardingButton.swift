//
//  OnboardingButton.swift
//  colorblend
//
//  Created by Hafidz Ismail Hidayat on 27/07/23.
//

import SwiftUI

struct OnboardingButton: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    @Binding var activeScreen: Int
    var maxIndex: Int = 1
    var onboarding: Onboarding

    var body: some View {
        Button(action: {
            if activeScreen == maxIndex {
                isOnboarding = false
            } else {
                activeScreen += 1
            }
        }){
            ZStack{
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 145, height: 40)
                    .foregroundColor(.blue)
                Text(onboarding.buttonText)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
    }
}

struct OnboardingButton_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingButton(activeScreen: .constant(0), onboarding: onboardingData[0])
    }
}
