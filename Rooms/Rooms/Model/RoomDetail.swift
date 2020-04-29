//
//  RoomDetail.swift
//  Room
//
//  Created by Do Le Duy on 4/28/20.
//  Copyright © 2020 Do Le Duy. All rights reserved.
//

import SwiftUI

struct RoomDetail: View {
    
    // roomModel không dùng @State vì nó được truyền từ ngoài vào
    let roomModel: RoomModel
    
    // zoomed tự quản lý nên zoomed là source of truth
    @State var zoomed: Bool = false
    
    var body: some View {
        
        ZStack (alignment: .topTrailing) {
            
            // Room Image
            Image(roomModel.name)
                .resizable()                                        // fill the size we have
                .aspectRatio(contentMode: zoomed ? .fill : .fit)    // maintain ratio
                .navigationBarTitle(Text(roomModel.name),displayMode: .inline)
                .onTapGesture {
                    withAnimation(.linear(duration: 2)) {
                        self.zoomed.toggle()
                    }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.gray.opacity(0.5))
            
            // Video Icon
            if !zoomed {
                Image(systemName: "video.fill")
                    .font(.title)
                    .padding()
                    .foregroundColor(.blue)
                    .transition(.move(edge: .trailing))
            }
        }
    }
}

struct RoomDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                RoomDetail(roomModel: testData[0])
            }
            
            NavigationView {
                RoomDetail(roomModel: testData[1])
            }
        }
    }
}
