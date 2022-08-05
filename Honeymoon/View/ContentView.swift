//
//  ContentView.swift
//  Honeymoon
//
//  Created by Aleksandrs Petruhins on 01/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    
    private let dragAreaThreshold: CGFloat = 65.0
    
    @State private var showAlert: Bool = false
    @State private var lastCardIndex: Int = 1
    
    @GestureState private var dragState: DragState = .inactive
    
    // MARK: - Card views
    
    @State var cardViews: [CardView] = {
        var views = [CardView]()
        
        for index in 0..<2 {
            views.append(CardView(destination: destinationData[index]))
        }
        
        return views
    }()
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            
            // MARK: - Header
            
            HeaderView()
                .opacity(dragState.isDragging ? 0 : 1)
                .animation(.default, value: UUID())
            
            Spacer()
            
            // MARK: - Cards
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay(
                            ZStack {
                                Image(systemName: "x.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width < -self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1 : 0)
                                
                                Image(systemName: "heart.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width > self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1 : 0)
                            } //: ZStack
                        )
                        .offset(
                            x: self.isTopCard(cardView: cardView) ? self.dragState.translation.width : 0,
                            y: self.isTopCard(cardView: cardView) ? self.dragState.translation.height : 0
                        )
                        .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: cardView) ? 0.85 : 1.0)
                        .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardView) ? Double(self.dragState.translation.width / 12) : 0))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120), value: UUID())
                        .gesture(
                            LongPressGesture(minimumDuration: 0.01)
                                .sequenced(before: DragGesture())
                                .updating(self.$dragState, body: { value, state, transation in
                                    switch value {
                                    case .first(true):
                                        state = .pressing
                                    case .second(true, let drag):
                                        state = .dragging(translation: drag?.translation ?? .zero)
                                    default:
                                        break
                                    }
                                }) //: Updating
                                .onEnded({ value in
                                    
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    
                                    if drag.translation.width < -self.dragAreaThreshold || drag.translation.width > self.dragAreaThreshold {
                                        
                                        self.moveCards()
                                        
                                    }
                                    
                                }) //: OnEnded
                        ) //: Gesture
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            // MARK: - Footer
            
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0 : 1)
                .animation(.default, value: UUID())
            
        } //: VStack
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Success".uppercased()), message: Text("Wishing a lovely and most precious of the times together for the amazing couple."), dismissButton: .default(Text("Happy Honeymoon!")))
        }
    }
    
    // MARK: - Functions
    
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else { return false }
            
        return index == 0
    }
    
    private func moveCards() {
        cardViews.removeFirst()
        
        self.lastCardIndex += 1
        let destination = destinationData[lastCardIndex % destinationData.count]

        let newCardView = CardView(destination: destination)
        cardViews.append(newCardView)
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
