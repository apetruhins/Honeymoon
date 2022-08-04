//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by Aleksandrs Petruhins on 04/08/2022.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.pink)
    }
}
