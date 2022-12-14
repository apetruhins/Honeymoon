//
//  FooterView.swift
//  Honeymoon
//
//  Created by Aleksandrs Petruhins on 03/08/2022.
//

import SwiftUI

struct FooterView: View {
    
    // MARK: - Properties
    
    @Binding var showBookingAlert: Bool
    
    let haptics = UINotificationFeedbackGenerator()
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            Image(systemName: "xmark.circle")
                .font(.system(size: 42, weight: .light))
            
            Spacer()
            
            Button {
                playSound(sound: "sound-click")
                self.haptics.notificationOccurred(.success)
                self.showBookingAlert.toggle()
            } label: {
                Text("Book Destination".uppercased())
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .accentColor(.pink)
                    .background(
                        Capsule()
                            .stroke(Color.pink, lineWidth: 2)
                    )
            }

            
            Spacer()
            
            Image(systemName: "heart.circle")
                .font(.system(size: 42, weight: .light))
        }
        .padding()
    }
}

// MARK: - Preview

struct FooterView_Previews: PreviewProvider {
    
    @State static var showAlert: Bool = false
    
    static var previews: some View {
        
        FooterView(showBookingAlert: $showAlert)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
