//
//  ContentView.swift
//  FullScreenModal
//
//  Created by Do Le Duy on 4/30/20.
//  Copyright © 2020 Do Le Duy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isPresented: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    self.isPresented.toggle()
                }) {Text("Show standard modal")}
            }
            .navigationBarTitle(Text("Standard"))
            .sheet(isPresented: $isPresented) {Text("HERE IS MY MODAL")}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
