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
    init(_ titleKey: LocalizedStringKey, symbol: Symbol) {
        self.init(titleKey, systemImage: symbol.rawValue)
    }

    @_disfavoredOverload
    nonisolated
    init<S>(_ title: S, symbol: Symbol) where S: StringProtocol {
        self.init(String(title), systemImage: symbol.rawValue)
    }

    @_disfavoredOverload
    nonisolated
    init(_ titleResource: LocalizedStringResource, symbol: Symbol) {
        self.init(titleResource, systemImage: symbol.rawValue)
    }
}

public extension Button where Label == SwiftUI.Label<Text, Image> {
    @_disfavoredOverload
    nonisolated
    init<S>(_ title: S, symbol: Symbol, role: ButtonRole? = nil, action: @escaping () -> Void) where S: StringProtocol {
        self.init(String(title), systemImage: symbol.rawValue, role: role, action: action)
    }

    nonisolated
    init(_ titleKey: LocalizedStringKey, symbol: Symbol, role: ButtonRole? = nil, action: @escaping () -> Void) {
        self.init(titleKey, systemImage: symbol.rawValue, role: role, action: action)
    }

    @_disfavoredOverload
    nonisolated
    init(_ titleResource: LocalizedStringResource, symbol: Symbol, role: ButtonRole? = nil, action: @escaping () -> Void) {
        self.init(titleResource, systemImage: symbol.rawValue, role: role, action: action)
    }
}

public extension NavigationLink where Label == SwiftUI.Label<Text, Image> {
    nonisolated
    init(_ titleKey: LocalizedStringKey, symbol: Symbol, @ViewBuilder destination: () -> Destination) {
        self.init(destination: destination) {
            SwiftUI.Label(titleKey, symbol: symbol)
        }
    }

    @_disfavoredOverload
    nonisolated
    init<S>(_ title: S, symbol: Symbol, @ViewBuilder destination: () -> Destination) where S: StringProtocol {
        let title = String(title)
        self.init(destination: destination) {
            SwiftUI.Label(title, symbol: symbol)
        }
    }

    @_disfavoredOverload
    nonisolated
    init(_ titleResource: LocalizedStringResource, symbol: Symbol, @ViewBuilder destination: () -> Destination) {
        self.init(destination: destination) {
            SwiftUI.Label(titleResource, symbol: symbol)
        }
    }

    nonisolated
    init<Value>(_ titleKey: LocalizedStringKey, symbol: Symbol, value: Value?) where Destination == Never, Value: Hashable {
        self.init(value: value) {
            SwiftUI.Label(titleKey, symbol: symbol)
        }
    }

    nonisolated
    init<Value>(verbatim title: String, symbol: Symbol, value: Value?) where Destination == Never, Value: Hashable {
        self.init(value: value) {
            SwiftUI.Label(title, symbol: symbol)
        }
    }

    @_disfavoredOverload
    nonisolated
    init<S, Value>(_ title: S, symbol: Symbol, value: Value?) where Destination == Never, S: StringProtocol, Value: Hashable {
        let title = String(title)
        self.init(value: value) {
            SwiftUI.Label(title, symbol: symbol)
        }
    }

    @_disfavoredOverload
    nonisolated
    init<Value>(_ titleResource: LocalizedStringResource, symbol: Symbol, value: Value?) where Destination == Never, Value: Hashable {
        self.init(value: value) {
            SwiftUI.Label(titleResource, symbol: symbol)
        }
    }
}

public extension Link where Label == SwiftUI.Label<Text, Image> {
    init(_ titleKey: LocalizedStringKey, symbol: Symbol, destination: URL) {
        self.init(destination: destination) {
            SwiftUI.Label(titleKey, symbol: symbol)
        }
    }

    nonisolated
    init(verbatim title: String, symbol: Symbol, destination: URL) {
        self.init(destination: destination) {
            SwiftUI.Label(title, symbol: symbol)
        }
    }

    @_disfavoredOverload
    nonisolated
    init<S>(_ title: S, symbol: Symbol, destination: URL) where S: StringProtocol {
        let title = String(title)
        self.init(destination: destination) {
            SwiftUI.Label(title, symbol: symbol)
        }
    }

    @_disfavoredOverload
    nonisolated
    init(_ titleResource: LocalizedStringResource, symbol: Symbol, destination: URL) {
        self.init(destination: destination) {
            SwiftUI.Label(titleResource, symbol: symbol)
        }
    }
}

public extension Menu where Label == SwiftUI.Label<Text, Image> {
    nonisolated
    init(_ title: LocalizedStringKey, symbol: Symbol, @ViewBuilder content: () -> Content) {
        self.init(title, systemImage: symbol.rawValue, content: content)
    }

    @_disfavoredOverload
    nonisolated
    init<S>(_ title: S, symbol: Symbol, @ViewBuilder content: () -> Content) where S: StringProtocol {
        self.init(String(title), systemImage: symbol.rawValue, content: content)
    }

    @_disfavoredOverload
    nonisolated
    init(_ titleResource: LocalizedStringResource, symbol: Symbol, @ViewBuilder content: () -> Content) {
        self.init(titleResource, systemImage: symbol.rawValue, content: content)
    }
}

public extension Picker where Label == SwiftUI.Label<Text, Image> {
    nonisolated
    init(_ title: LocalizedStringKey, symbol: Symbol, selection: Binding<SelectionValue>, @ViewBuilder content: () -> Content) {
        self.init(title, systemImage: symbol.rawValue, selection: selection, content: content)
    }

    @_disfavoredOverload
    nonisolated
    init<S>(_ title: S, symbol: Symbol, selection: Binding<SelectionValue>, @ViewBuilder content: () -> Content) where S: StringProtocol {
        self.init(String(title), systemImage: symbol.rawValue, selection: selection, content: content)
    }

    @_disfavoredOverload
    nonisolated
    init(_ titleResource: LocalizedStringResource, symbol: Symbol, selection: Binding<SelectionValue>, @ViewBuilder content: () -> Content) {
        self.init(titleResource, systemImage: symbol.rawValue, selection: selection, content: content)
    }
}

public extension ControlGroup {
    nonisolated
    init<Controls>(_ title: LocalizedStringKey, symbol: Symbol, @ViewBuilder content: () -> Controls) where Content == LabeledControlGroupContent<Controls, SwiftUI.Label<Text, Image>>, Controls: View {
        self.init(title, systemImage: symbol.rawValue, content: content)
    }

    @_disfavoredOverload
    nonisolated
    init<S, Controls>(_ title: S, symbol: Symbol, @ViewBuilder content: () -> Controls) where Content == LabeledControlGroupContent<Controls, SwiftUI.Label<Text, Image>>, S: StringProtocol, Controls: View {
        self.init(String(title), systemImage: symbol.rawValue, content: content)
    }

    @_disfavoredOverload
    nonisolated
    init<Controls>(_ titleResource: LocalizedStringResource, symbol: Symbol, @ViewBuilder content: () -> Controls) where Content == LabeledControlGroupContent<Controls, SwiftUI.Label<Text, Image>>, Controls: View {
        self.init(titleResource, systemImage: symbol.rawValue, content: content)
    }
}

public extension ContentUnavailableView where Label == SwiftUI.Label<Text, Image>, Description == Text?, Actions == EmptyView {
    nonisolated
    init(_ title: LocalizedStringKey, symbol: Symbol, description: Text? = nil) {
        self.init(title, systemImage: symbol.rawValue, description: description)
    }

    @_disfavoredOverload
    nonisolated
    init<S>(_ title: S, symbol: Symbol, description: Text? = nil) where S: StringProtocol {
        self.init(String(title), systemImage: symbol.rawValue, description: description)
    }

    @_disfavoredOverload
    nonisolated
    init(_ titleResource: LocalizedStringResource, symbol: Symbol, description: Text? = nil) {
        self.init(titleResource, systemImage: symbol.rawValue, description: description)
    }
}

public extension Toggle where Label == SwiftUI.Label<Text, Image> {
    nonisolated
    init(_ titleKey: LocalizedStringKey, symbol: Symbol, isOn: Binding<Bool>) {
        self.init(titleKey, systemImage: symbol.rawValue, isOn: isOn)
    }

    @_disfavoredOverload
    nonisolated
    init<S>(_ title: S, symbol: Symbol, isOn: Binding<Bool>) where S: StringProtocol {
        self.init(String(title), systemImage: symbol.rawValue, isOn: isOn)
    }

    @_disfavoredOverload
    nonisolated
    init(_ titleResource: LocalizedStringResource, symbol: Symbol, isOn: Binding<Bool>) {
        self.init(titleResource, systemImage: symbol.rawValue, isOn: isOn)
    }
}
#endif
