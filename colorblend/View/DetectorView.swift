//
//  DetectorView.swift
//  colorblend
//
//  Created by Hafidz Ismail Hidayat on 26/07/23.
//

import SwiftUI

struct DetectorView: View {
    @StateObject var cameraSearch = DetectorController()
    var body: some View {
        ZStack{
            HostedViewController(cameraSearch: cameraSearch)
                .ignoresSafeArea()
        }
    }
}
