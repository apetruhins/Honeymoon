//
//  HeaderView.swift
//  Honeymoon
//
//  Created by Aleksandrs Petruhins on 03/08/2022.
//

import SwiftUI

struct HeaderView: View {
    
    // MARK: - Properties
    
    @State var showInfoView: Bool = false
    @State var showGuideView: Bool = false
    
    let haptics = UINotificationFeedbackGenerator()
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            Button {
                playSound(sound: "sound-click")
                self.haptics.notificationOccurred(.success)
                self.showInfoView.toggle()
            } label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .accentColor(.primary)
            
            Spacer()
            
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            
            Spacer()
            
            Button {
                playSound(sound: "sound-click")
                self.haptics.notificationOccurred(.success)
                self.showGuideView.toggle()
            } label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .accentColor(.primary)
            .sheet(isPresented: $showInfoView) {
                InfoView()
            }
            .sheet(isPresented: $showGuideView) {
                GuideView()
            }

        } //: HStack
        .padding()
    }
}

// MARK: - Preview

struct HeaderView_Previews: PreviewProvider {
    
    static var previews: some View {
        HeaderView()
            .previewLayout(PreviewLayout.fixed(width: 375, height: 80))
    }
}
