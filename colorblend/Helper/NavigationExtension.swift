//
//  SwiftUIView.swift
//  colorblend
//
//  Created by Hafidz Ismail Hidayat on 27/07/23.
//

import SwiftUI

extension View {

    func setNavbarColor(color: Color) {

    }

    func setNavbarTitleColor(color: Color) {

    }
}

// NavigationController Helpers
extension UINavigationController {

    open override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
//        UINavigationBar.appearance().shadowImage = UIImage().
//        UINavigationBar.appearance().s = UIImage()
        UINavigationBar
            .appearance()
            .backIndicatorImage = UIImage(systemName: "chevron.backward")?
            .withTintColor(UIColor.systemBlue, renderingMode: .alwaysOriginal)
        UINavigationBar
            .appearance()
            .backIndicatorTransitionMaskImage = UIImage(systemName: "chevron.backward")?
            .withTintColor(UIColor.systemBlue)
        UINavigationBar.appearance().tintColor = UIColor.systemBlue
        UIBarButtonItem.appearance().setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.systemBlue
        ], for: .normal)
    }
}
