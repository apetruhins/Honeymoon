//
//  ContentView.swift
//  Honeymoon
//
//  Created by Aleksandrs Petruhins on 01/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    
    @State var showAlert: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            
            HeaderView()
            
            Spacer()
            
            CardView(destination: destinationData[0])
                .padding()
            
            Spacer()
            
            FooterView(showBookingAlert: $showAlert)
            
        } //: VStack
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Success".uppercased()), message: Text("Wishing a lovely and most precious of the times together for the amazing couple."), dismissButton: .default(Text("Happy Honeymoon!")))
        }
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
