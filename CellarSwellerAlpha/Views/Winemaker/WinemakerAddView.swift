//
//  WinemakerAddView.swift
//  CellarSwellerAlpha
//
//  Created by Stephen Rossman on 4/19/22.
//

import SwiftUI

struct WinemakerAddView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var website = ""
    
    var body: some View {
        List {
            TextField("Name", text: $name)
            TextField("Website", text: $website)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel", action: {
                    presentationMode.wrappedValue.dismiss()
                })
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save", action: {
                    let new = Winemaker(context: viewContext)
                    new.id = UUID.init()
                    new.name = name
                    
                    do {
                        try viewContext.save()
                    } catch {
                        let nserror = error as NSError
                        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                    }
                    
                    presentationMode.wrappedValue.dismiss()
                })
            }
        }
    }
}
