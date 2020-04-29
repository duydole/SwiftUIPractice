//
//  RoomCell.swift
//  Room
//
//  Created by Do Le Duy on 4/29/20.
//  Copyright © 2020 Do Le Duy. All rights reserved.
//

import SwiftUI

struct RoomCell: View {
    let room: RoomModel
    var body: some View {
        NavigationLink(destination: RoomDetail(roomModel: room)) {
            Image(room.name)
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(room.name)
                    .fontWeight(.bold)
                Text("\(room.capacity) people")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct RoomCell_Previews: PreviewProvider {
    static var previews: some View {
        RoomCell(room: testData[0])
    }
}
