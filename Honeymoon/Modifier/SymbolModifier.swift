//
//  SymbolModifier.swift
//  Honeymoon
//
//  Created by Aleksandrs Petruhins on 05/08/2022.
//

import SwiftUI

struct SymbolModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 128))
            .shadow(color: .black.opacity(0.2), radius: 12, x: 0, y: 0)
    }
}
