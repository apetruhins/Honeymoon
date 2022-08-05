//
//  DragState.swift
//  Honeymoon
//
//  Created by Aleksandrs Petruhins on 04/08/2022.
//

import SwiftUI

enum DragState {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .dragging(let translation):
            return translation
        default:
            return .zero
        }
    }

    var isDragging: Bool {
        switch self {
        case .dragging:
            return true
        default:
            return false
        }
    }
    
    var isPressing: Bool {
        switch self {
        case .dragging, .pressing:
            return true
        default:
            return false
        }
    }
}
