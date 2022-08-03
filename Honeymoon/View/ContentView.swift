//
//  ContentView.swift
//  Honeymoon
//
//  Created by Aleksandrs Petruhins on 01/08/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            HeaderView()
            
            Spacer()
            
            CardView(destination: destinationData[0])
                .padding()
            
            Spacer()
            
            FooterView()
            
        } //: VStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
