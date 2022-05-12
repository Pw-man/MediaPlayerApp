//
//  VideoViewController.swift
//  Navigation
//
//  Created by Роман on 08.12.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import AVKit

class VideoViewController: UIViewController {
        
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tableView.dataSource = self
        tableView.delegate = self
//        tabBarItem.title = "Videos"
//        tabBarItem.image =  UIImage(systemName: "video.fill")!
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.backgroundColor = .systemRed
    }
}

extension VideoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Videos.videoFiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = VideoTableViewCell()
        cell.video = Videos.videoFiles[indexPath.row]
       return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(200)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let videoPlayerVC = VideoPlayerViewController()
        videoPlayerVC.video = Videos.videoFiles[indexPath.row]
        self.navigationController?.present(videoPlayerVC, animated: true, completion: nil)
    }
}
