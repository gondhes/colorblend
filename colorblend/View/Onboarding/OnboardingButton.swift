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
                    .fill(
                        LinearGradient(colors: [Color("ButtonGradient1"), Color("ButtonGradient2")], startPoint: .leading, endPoint: .trailing)

                    )
                    .frame(width: 145, height: 40)
                    
                Text(onboarding.buttonText)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            
        }
    }
}

struct OnboardingSkipButton: View{
    @AppStorage("isOnboarding") var isOnboarding: Bool?

    var body: some View{
        Button(action: {
            isOnboarding = false
        }){
            ZStack{
                Text("Skip")
                    .foregroundColor(Color(.systemBlue))
            }
        }
    }
}

struct OnboardingButton_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingButton(activeScreen: .constant(0), onboarding: onboardingData[0])
    }
}
