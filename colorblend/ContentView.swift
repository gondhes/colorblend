//
//  ContentView.swift
//  colorblend
//
//  Created by Fajar Wirazdi on 07/07/23.
//

import SwiftUI

struct ContentView: View {
    var colorModel = String()
    @State var isActive: Bool = false

    var body: some View {
        ZStack {
            if self.isActive{
                MainScreenView()
            }else{
                SplashView()
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now()+2.5) {
                withAnimation{
                    self.isActive = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
