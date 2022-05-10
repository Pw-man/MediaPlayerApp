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
        viewControllers = [AudioViewController(), VideoViewController()]
    }
}
