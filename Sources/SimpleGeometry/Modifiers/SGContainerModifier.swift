//
//  SGContainerModifier.swift
//  
//
//  Created by Donavon Buchanan on 10/13/20.
//

import SwiftUI

struct SGContainerModifier: ViewModifier {
    // MARK: Lifecycle
    init(
        to sgObject: SGObject
    ) {
        _sgObject = StateObject(wrappedValue: sgObject)
    }
    
    // MARK: Internal
    @StateObject
    private var sgObject: SGObject
    
    func body(content: Content) -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .allowsHitTesting(false)
                .readFrame(to: sgObject)
            
            content
        }
    }
}
