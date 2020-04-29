//
//  ContentView.swift
//  Room
//
//  Created by Do Le Duy on 4/28/20.
//  Copyright © 2020 Do Le Duy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    /**
     * ObservedObject là root of truth.
     * Khi store thay đổi thì sẽ not đến all view dùng value của nó.
     */
    @ObservedObject var store = RoomStore()
    
    var body: some View {
            
        // Dùng navigationView để có thanh navigationbar ở trên
        NavigationView {
            
            // List 2 sections
            List {
                
                // Section 1: chứa UI của AddRoom button
                Section {
                    Button(action: {
                        withAnimation { self.addRoom() }
                    }) { Text("AddRoom") }
                }
                
                // Section 2: chứa UI của list rooms ~ CollectionView
                Section {
                    ForEach (store.rooms) { room in
                        RoomCell(room: room)
                    }
                    // truyền 2 selector vào cho 2 events
                    .onDelete(perform: deleteRooms(at:))
                    .onMove(perform: move(from:to:))
                }
            }
            /* Thuộc tính của List */
            .navigationBarTitle(Text("Rooms"))
            .listStyle(GroupedListStyle.init())
            .navigationBarItems(trailing: EditButton())
        }
        
    }
    
    // Add new room
    func addRoom() {
        store.rooms.append(RoomModel(name: "Tokyo", capacity: 100, hasVideo: true))
    }
    
    // Delete event
    func deleteRooms(at offsets: IndexSet) {
        store.rooms.remove(atOffsets: offsets)
    }
    
    // Move event
    func move(from source: IndexSet, to destination: Int) {
        store.rooms.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Preview with 3 screens
        Group {
            
            ContentView(store: RoomStore(rooms: testData))
            
            ContentView(store: RoomStore(rooms: testData))
                .environment(\.sizeCategory, .extraExtraExtraLarge)
            
            ContentView(store: RoomStore(rooms: testData))
                .environment(\.colorScheme, .dark)
        }
    }
}
