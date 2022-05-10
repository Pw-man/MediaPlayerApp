//
//  VideoModel.swift
//  MediaPlayer
//
//  Created by Роман on 09.05.2022.
//

import UIKit

struct VideoFile {
    let url: URL
    let image: UIImage
    let name: String
}

struct Videos {
    static let videoFiles: [VideoFile] = [
        VideoFile(url: URL(string: "https://www.youtube.com/embed/0AcvHuGeOZE?playsinline=1")!, image: UIImage(named: "render-audi-rs7")!, name: "Audi RS 7"),
        VideoFile(url: URL(string: "https://www.youtube.com/embed/VOp9cpqE_EE?playsinline=1")!, image: UIImage(named: "maxresdefault")!, name: "Mercedes S Class L"),
        VideoFile(url: URL(string: "https://www.youtube.com/embed/lVvK1OI3Cu4?playsinline=1")!, image: UIImage(named: "chiron")!, name: "BUGATTI Chiron Sport")
    ]
}
