//
//  MainView.swift
//  CellarSwellerAlpha
//
//  Created by Stephen Rossman on 4/18/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            WinemakerListView()
                .tabItem {
                    Label("Makers", systemImage: "leaf.fill")
                }
//            WineListView()
//                .tabItem {
//                    Label("Wines", systemImage: "book.fill")
//                }
//            BottleListView()
//                .tabItem {
//                    Label("Bottles", systemImage: "drop.fill")
//                }
        }
    }
}
