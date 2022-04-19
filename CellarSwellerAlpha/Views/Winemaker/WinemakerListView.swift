//
//  ContentView.swift
//  CellarSwellerAlpha
//
//  Created by Stephen Rossman on 4/18/22.
//

import SwiftUI
import CoreData

struct WinemakerListView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Winemaker.name, ascending: true)],
        animation: .default)
    private var winemakers: FetchedResults<Winemaker>

    var body: some View {
        NavigationView {
            List {
                ForEach(winemakers) { winemaker in
                    NavigationLink(destination: WinemakerDetailsView(winemaker: winemaker)) {
                        Text(winemaker.name!)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    NavigationLink(destination: WinemakerAddView()) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { winemakers[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
