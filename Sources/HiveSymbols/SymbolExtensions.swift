//
//  SymbolExtensions.swift
//  Hive604Symbols
//
//  Created by Steven Fisher on 2026-03-21.
//

#if canImport(SwiftUI)
import SwiftUI

public extension Image {
    nonisolated
    init(symbol: Symbol) {
        self.init(systemName: symbol.rawValue)
    }
}

public extension Label where Title == Text, Icon == Image {
    nonisolated
    init(_ title: String, symbol: Symbol) {
        self.init(title, systemImage: symbol.rawValue)
    }
}

public extension Button where Label == SwiftUI.Label<Text, Image> {
    nonisolated
    init(_ title: String, symbol: Symbol, role: ButtonRole? = nil, action: @escaping () -> Void) {
        self.init(title, systemImage: symbol.rawValue, role: role, action: action)
    }
}

public extension NavigationLink where Label == SwiftUI.Label<Text, Image> {
    nonisolated
    init(_ title: String, symbol: Symbol, @ViewBuilder destination: () -> Destination) {
        self.init(destination: destination) {
            SwiftUI.Label(title, symbol: symbol)
        }
    }

    nonisolated
    init<Value>(_ title: String, symbol: Symbol, value: Value?) where Destination == Never, Value: Hashable {
        self.init(value: value) {
            SwiftUI.Label(title, symbol: symbol)
        }
    }
}

public extension Link where Label == SwiftUI.Label<Text, Image> {
    init(_ title: String, symbol: Symbol, destination: URL) {
        self.init(destination: destination) {
            SwiftUI.Label(title, symbol: symbol)
        }
    }
}

public extension Menu where Label == SwiftUI.Label<Text, Image> {
    nonisolated
    init(_ title: LocalizedStringKey, symbol: Symbol, @ViewBuilder content: () -> Content) {
        self.init(title, systemImage: symbol.rawValue, content: content)
    }
}

public extension Picker where Label == SwiftUI.Label<Text, Image> {
    nonisolated
    init(_ title: LocalizedStringKey, symbol: Symbol, selection: Binding<SelectionValue>, @ViewBuilder content: () -> Content) {
        self.init(title, systemImage: symbol.rawValue, selection: selection, content: content)
    }
}

public extension ControlGroup {
    nonisolated
    init<Controls>(_ title: LocalizedStringKey, symbol: Symbol, @ViewBuilder content: () -> Controls) where Content == LabeledControlGroupContent<Controls, SwiftUI.Label<Text, Image>>, Controls: View {
        self.init(title, systemImage: symbol.rawValue, content: content)
    }
}

public extension ContentUnavailableView where Label == SwiftUI.Label<Text, Image>, Description == Text?, Actions == EmptyView {
    nonisolated
    init(_ title: LocalizedStringKey, symbol: Symbol, description: Text? = nil) {
        self.init(title, systemImage: symbol.rawValue, description: description)
    }
}

public extension Toggle where Label == SwiftUI.Label<Text, Image> {
    nonisolated
    init(_ title: String, symbol: Symbol, isOn: Binding<Bool>) {
        self.init(title, systemImage: symbol.rawValue, isOn: isOn)
    }
}
#endif
