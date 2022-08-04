//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by Aleksandrs Petruhins on 04/08/2022.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(
                Capsule()
                    .fill(Color.pink)
                    .foregroundColor(.white)
            )
    }
}
