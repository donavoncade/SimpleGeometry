//
//  LibraryContentItems.swift
//  
//
//  Created by Donavon Buchanan on 10/2/20.
//

#if canImport(DeveloperToolsSupport)
import SwiftUI
import DeveloperToolsSupport

@available(iOS 14.0, macOS 11.0, macCatalyst 14.0, tvOS 14.0, watchOS 7.0, *)
public struct LibraryModifierContent: LibraryContentProvider {
    var identifiableRect = IdentifiableRect()
    
    @Binding
    var size: CGSize
    
    let frameBehavior: FrameBehavior
    
    @Binding
    var frameRect: CGRect
    let coordinateSpace: CoordinateSpace
    
//    @LibraryContentBuilder
    public func modifiers(base: AnyView) -> [LibraryItem] {
        var items: [LibraryItem] = []
        #if !os(macOS)
        items.append(
            LibraryItem(base.readFrame(to: identifiableRect), visible: true, title: "Read Frame", category: .layout)
        )
        #endif
        items.append(
            LibraryItem(base.readFrameToRect(to: $frameRect, in: coordinateSpace, frameBehavior: frameBehavior), visible: true, title: "Read Frame to CGRect", category: .layout)
        )
        return items
    }
}
#endif
