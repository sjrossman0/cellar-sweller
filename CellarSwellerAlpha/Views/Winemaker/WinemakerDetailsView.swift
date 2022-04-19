//
//  WinemakerDetailsView.swift
//  CellarSwellerAlpha
//
//  Created by Stephen Rossman on 4/18/22.
//

import SwiftUI

struct WinemakerDetailsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var winemaker: Winemaker
    
    var body: some View {
        List {
            Text(winemaker.id!.uuidString)
            Text(winemaker.name!)
        }
    }
}
