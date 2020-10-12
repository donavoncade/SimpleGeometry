//
//  GeometryModifier.swift
//
//
//  Created by Donavon Buchanan on 10/6/20.
//

import SwiftUI

public enum FrameBehavior {
    case `default`, fill
}

struct GeometryModifier: ViewModifier {
    // MARK: Lifecycle

    init(
        to: Binding<CGRect>,
        _ behavior: FrameBehavior = .default,
        _ coordinateSpace: CoordinateSpace = .global
    ) {
        _sgObject = .init(wrappedValue: .init(to: to, behavior: behavior, coordinateSpace: coordinateSpace))
    }

    // MARK: Internal

    @StateObject
    private var sgObject: SGObject

    func body(content: Content) -> some View {
        content
            .modifier(SGModifier(sgObject))
    }

    func dispatch(_ action: ()) {
        DispatchQueue(label: "PreferenceKeysQueue").async {
            action
        }
    }
}
