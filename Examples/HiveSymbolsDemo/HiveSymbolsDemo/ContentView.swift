//
//  ContentView.swift
//  HiveSymbolsDemo
//
//  Created by Steven Fisher on 2026-05-27.
//

import HiveSymbols
import SwiftUI

struct ContentView: View {
    @State private var saveCount = 0
    @State private var showSharedItems = true
    @State private var selectedDestination: DemoDestination?
    @State private var selectedSort = SortOption.name

    private let sampleSymbols: [(name: String, symbol: Symbol)] = [
        ("Document", .document),
        ("Folder", .folder),
        ("Archive", .archiveBox),
        ("Trash", .trash),
        ("Share", .squareAndArrowUp),
        ("Edit", .squareAndPencil)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 28) {
                    SectionView("Image(symbol:)") {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 88), spacing: 16)], spacing: 16) {
                            ForEach(sampleSymbols, id: \.name) { sample in
                                VStack(spacing: 10) {
                                    Image(symbol: sample.symbol)
                                        .font(.system(size: 32))
                                        .foregroundStyle(.tint)
                                        .frame(width: 56, height: 56)
                                        .background(.tint.opacity(0.12), in: RoundedRectangle(cornerRadius: 8))

                                    Text(sample.name)
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                                .frame(maxWidth: .infinity)
                            }
                        }
                    }

                    SectionView("Label(_:symbol:)") {
                        VStack(alignment: .leading, spacing: 12) {
                            Label("Synced Documents", symbol: .documentBadgeEllipsis)
                            Label("Shared Folder", symbol: .folderBadgePersonCrop)
                            Label("Ready to Archive", symbol: .archiveBox)
                        }
                        .font(.headline)
                    }

                    SectionView("Button(_:symbol:action:)") {
                        HStack(spacing: 12) {
                            Button("Save", symbol: .squareAndArrowDown) {
                                saveCount += 1
                            }
                            .buttonStyle(.borderedProminent)

                            Button("Delete", symbol: .trash, role: .destructive) {}
                                .buttonStyle(.bordered)
                        }

                        Text("Save tapped \(saveCount) time\(saveCount == 1 ? "" : "s")")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }

                    SectionView("NavigationLink(_:symbol:destination:)") {
                        NavigationLink("Open Documents", symbol: .document) {
                            DestinationView(title: "Documents", symbol: .document)
                        }
                        .buttonStyle(.bordered)
                    }

                    SectionView("NavigationLink(_:symbol:value:)") {
                        List(DemoDestination.allCases, selection: $selectedDestination) { destination in
                            NavigationLink(destination.title, symbol: destination.symbol, value: destination)
                        }
                        .frame(minHeight: 142)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }

                    SectionView("Link(_:symbol:destination:)") {
                        if let url = URL(string: "https://developer.apple.com/sf-symbols/") {
                            Link("SF Symbols", symbol: .link, destination: url)
                        }
                    }

                    SectionView("Menu(_:symbol:content:)") {
                        Menu("New Item", symbol: .documentBadgePlus) {
                            Button("Document", symbol: .document) {}
                            Button("Folder", symbol: .folderBadgePlus) {}
                            Button("Archive", symbol: .archiveBox) {}
                        }
                    }

                    SectionView("Picker(_:symbol:selection:content:)") {
#if os(macOS)
                        sortPicker
                            .pickerStyle(.menu)
                            .fixedSize()
                            .padding(.vertical, 6)
#else
                        List {
                            sortPicker
                                .pickerStyle(.navigationLink)
                        }
                        .frame(minHeight: 88)
                        .scrollDisabled(true)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
#endif
                    }

                    SectionView("ControlGroup(_:symbol:content:)") {
                        ControlGroup("Document Actions", symbol: .document) {
                            Button("Share", symbol: .squareAndArrowUp) {}
                            Button("Archive", symbol: .archiveBox) {}
                            Button("Delete", symbol: .trash, role: .destructive) {}
                        }
                    }

                    SectionView("ContentUnavailableView(_:symbol:description:)") {
                        ContentUnavailableView(
                            "No Documents",
                            symbol: .documentCircle,
                            description: Text("Create or import a document to see it here.")
                        )
                        .frame(maxWidth: .infinity, minHeight: 180)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    }

                    SectionView("Toggle(_:symbol:isOn:)") {
                        Toggle("Show Shared Items", symbol: .folderBadgePersonCrop, isOn: $showSharedItems)
                            .toggleStyle(.switch)
                    }
                }
                .padding()
            }
            .navigationTitle("Hive Symbols")
            .navigationDestination(for: DemoDestination.self) { destination in
                DestinationView(title: destination.title, symbol: destination.symbol)
            }
        }
    }

    private var sortPicker: some View {
        Picker("Sort", symbol: .listBulletRectangle, selection: $selectedSort) {
            ForEach(SortOption.allCases) { option in
                Text(option.title).tag(option)
            }
        }
    }
}

private enum DemoDestination: String, CaseIterable, Identifiable {
    case documents
    case folders
    case archive

    var id: Self { self }

    var title: String {
        switch self {
        case .documents:
            "Documents"
        case .folders:
            "Folders"
        case .archive:
            "Archive"
        }
    }

    var symbol: Symbol {
        switch self {
        case .documents:
            .document
        case .folders:
            .folder
        case .archive:
            .archiveBox
        }
    }
}

private enum SortOption: String, CaseIterable, Identifiable {
    case name
    case date
    case kind

    var id: Self { self }

    var title: String {
        switch self {
        case .name:
            "Name"
        case .date:
            "Date"
        case .kind:
            "Kind"
        }
    }
}

private struct DestinationView: View {
    let title: String
    let symbol: Symbol

    var body: some View {
        VStack(spacing: 16) {
            Image(symbol: symbol)
                .font(.system(size: 56))
                .foregroundStyle(.tint)

            Text(title)
                .font(.title.bold())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

private struct SectionView<Content: View>: View {
    let title: String
    @ViewBuilder let content: Content

    init(_ title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title3.bold())

            content
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ContentView()
}
