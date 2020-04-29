//
//  CardView.swift
//  Demo SwiftUI 1
//
//  Created by Do Le Duy on 4/26/20.
//  Copyright © 2020 Do Le Duy. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    @Binding var imageName:String
    @Binding var backgroundColor:Color

    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .background(backgroundColor.opacity(0.5))
            .cornerRadius(20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(imageName: Binding.constant("apple"), backgroundColor: Binding.constant(Color.red))
    }
}
