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

                    SectionView("ContentUnavailableView(_:symbol:description:)") {
                        ContentUnavailableView(
                            "No Documents",
                            symbol: .documentCircle,
                            description: Text("Create or import a document to see it here.")
                        )
                        .frame(maxWidth: .infinity, minHeight: 180)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding()
            }
            .navigationTitle("Hive Symbols")
        }
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
