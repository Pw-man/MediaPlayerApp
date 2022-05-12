//
//  MainTabBarController.swift
//  MediaPlayer
//
//  Created by Роман on 09.05.2022.
//

import UIKit

final class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        let videoViewController = VideoViewController()
        videoViewController.tabBarItem.title = "Video"
        videoViewController.tabBarItem.image =  UIImage(systemName: "video.fill")!
        let audioViewController = AudioViewController()
        audioViewController.tabBarItem.title = "Music"
        audioViewController.tabBarItem.image =  UIImage(systemName: "headphones.circle.fill")!
        viewControllers = [audioViewController, videoViewController]
    }
}
