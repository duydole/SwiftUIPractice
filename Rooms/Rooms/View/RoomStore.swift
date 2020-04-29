//
//  RoomStore.swift
//  Room
//
//  Created by Do Le Duy on 4/29/20.
//  Copyright © 2020 Do Le Duy. All rights reserved.
//

import Foundation
import Combine

/**
 * RoomStore là root of truth/ RoomStore change thì update UI nên phải implement protocol ObservableObject
 * RoomStore() lưu all room data.
 */
class RoomStore : ObservableObject {
    
    var rooms: [RoomModel] {
        didSet { objectWillChange.send() }
    }
    
    init(rooms: [RoomModel] = []) {
        self.rooms = rooms
    }

    let objectWillChange = PassthroughSubject<Void, Never>()
}
