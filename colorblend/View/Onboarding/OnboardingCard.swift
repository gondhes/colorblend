//
//  Onboarding1.swift
//  colorblend
//
//  Created by Hafidz Ismail Hidayat on 27/07/23.
//

import SwiftUI

struct OnboardingCard: View {
    var onboarding: Onboarding
    
    @State private var isAnimating: Bool = false
    @Binding var activeScreen: Int
    var maxIndex: Int = 1
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Image(onboarding.image)
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 40)
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: 40)
                        .foregroundColor(Color("Onboarding"))
                    VStack(spacing: 20){
                        Text(onboarding.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .frame(width: 180)
                        Text(onboarding.body)
                            .font(.body)
                            .multilineTextAlignment(.center)
                        Spacer()
                        OnboardingButton(activeScreen: $activeScreen, maxIndex: maxIndex, onboarding: onboarding)
                    }
                    .foregroundColor(.black)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 60)
                    .padding(.top, -20)
                }
                .frame(height: 360)
            }
        }
        .ignoresSafeArea()
        .onAppear{
            withAnimation(.easeOut(duration: 0.5)){
                isAnimating = true
            }
        }
    }
}

struct OnboardingCardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCard(onboarding: onboardingData[1], activeScreen: .constant(0))
    }
}
