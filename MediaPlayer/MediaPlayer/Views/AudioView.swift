//
//  AudioViews.swift
//  MediaPlayer
//
//  Created by Роман on 09.05.2022.
//

import UIKit

class AudioView: UIView {
    
    let songNameLabel : UILabel = {
        let label = UILabel()
        label.text = "Current song name"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    let recordButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "record.circle.fill"), for: .normal)
        button.tintColor = .red
        button.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 15)
        button.imageView?.layer.masksToBounds = false
        return button
    }()
    
    let playRecodedButton : UIButton = {
        let button = UIButton()
        button.setTitle("Play recorded sound", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.setTitleColor(.systemRed, for: .normal)
        return button
    }()
    
    let stopButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "stop.fill"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    let pauseButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    let playButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    let forwardButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "forward.fill"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    let backwardButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "backward.fill"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    func setupViews() {
        backgroundColor = .white
        addSubview(songNameLabel)
        addSubview(playButton)
        addSubview(pauseButton)
        addSubview(stopButton)
        addSubview(forwardButton)
        addSubview(backwardButton)
    }
    
    func subviewsLayout() {
        songNameLabel.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
        
        playButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(songNameLabel.snp.bottom).offset(100)
        }
        
        stopButton.snp.makeConstraints { make in
            make.top.equalTo(playButton)
            make.trailing.equalTo(safeAreaLayoutGuide).inset(16)
        }
        
        pauseButton.snp.makeConstraints { make in
            make.top.equalTo(playButton)
            make.leading.equalTo(safeAreaLayoutGuide).inset(16)
        }
        
        forwardButton.snp.makeConstraints { make in
            make.top.equalTo(playButton.snp.bottom).offset(50)
            make.trailing.equalTo(safeAreaLayoutGuide).inset(50)
        }
        
        backwardButton.snp.makeConstraints { make in
            make.top.equalTo(playButton.snp.bottom).offset(50)
            make.leading.equalTo(safeAreaLayoutGuide).inset(50)
        }
    }
    
    func loadRecordingUI() {
        addSubview(recordButton)
        addSubview(playRecodedButton)
        
        recordButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(safeAreaLayoutGuide).offset(50)
        }
        
        playRecodedButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.top.equalTo(safeAreaLayoutGuide).offset(50)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        setupViews()
        subviewsLayout()
    }
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

