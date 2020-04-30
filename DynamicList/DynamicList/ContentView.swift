//
//  ContentView.swift
//  DynamicList
//
//  Created by Do Le Duy on 4/30/20.
//  Copyright © 2020 Do Le Duy. All rights reserved.
//

import SwiftUI

// User must conform Identifiable protocol to use with List
struct User : Identifiable {
    let id = UUID()
    let username, message, imagename: String
}

struct ContentView: View {
    
    private let users: [User] = [
        .init(username: "Tim Cook", message: "My nice shiny new monitor stand is $999", imagename: "1"),
        .init(username: "Craig Federighi", message: "My nice shiny new monitor stand is $999",imagename: "2"),
        .init(username: "Jon Ivey", message: "My nice shiny new monitor stand is $999", imagename: "3"),
    ]
    
    var body: some View {
        NavigationView {
            List {
                // Header
                Section {Text("Users").font(.largeTitle)}
                
                // Body
                Section {
                    ForEach (self.users) { user in
                        UserRow(user: user)
                    }
                }
            }
            .navigationBarTitle(Text("Dynamic List"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct UserRow: View {
    var user: User
    var body: some View {
        HStack {
            Image(user.imagename)
                .resizable()
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 2))
            
            
            VStack (alignment: .leading) {
                Text(user.username).font(.headline)
                Text(user.message).font(.subheadline)
            }
        }.padding(.all, 5)
    }
}
