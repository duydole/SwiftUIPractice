//
//  Room.swift
//  Room
//
//  Created by Do Le Duy on 4/28/20.
//  Copyright © 2020 Do Le Duy. All rights reserved.
//

import Foundation

struct RoomModel : Identifiable {
    var id = UUID()
    var name: String
    var capacity: Int
    var hasVideo: Bool = false
    var imageName: String {
        return name
    }
    var thumbnailName: String {
        return name + "Thumb"
    }
}
#if DEBUG
let testData = [
    RoomModel(name: "Observation Deck", capacity: 8, hasVideo: true),
    RoomModel(name: "Executive Suit", capacity: 1000, hasVideo: false),
    RoomModel(name: "Charter Jet", capacity: 200, hasVideo: true),
    RoomModel(name: "Dungeon", capacity: 50, hasVideo: true),
    RoomModel(name: "Panorama", capacity: 63, hasVideo: true),
    RoomModel(name: "Tokyo", capacity: 100, hasVideo: true),
]
#endif
