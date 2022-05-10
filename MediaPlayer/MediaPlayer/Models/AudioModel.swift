//
//  Model.swift
//  MediaPlayer
//
//  Created by Роман on 09.05.2022.
//

import Foundation

struct Song {
    let name: String
    let url: URL
}

struct Songs {
    static let songList: [Song] = [
        Song(name: "Let it snow" , url: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Frank Sinatra. Let it snow", ofType: "mp3")!)),
        Song(name: "Love Is Here To Stay" , url: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Louis Armstrong & Ella Fitzgerald. Love Is Here To Stay", ofType: "mp3")!)),
        Song(name: "Midnight City" , url: URL.init(fileURLWithPath: Bundle.main.path(forResource: "M83. Midnight City", ofType: "mp3")!)),
        Song(name: "If I Didn't Care" , url: URL.init(fileURLWithPath: Bundle.main.path(forResource: "The Ink Spots. If I Didn't Care", ofType: "mp3")!)),
        Song(name: "The show must go on" , url: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Queen", ofType: "mp3")!))
    ]
}
