//
//  AudioViewController.swift
//  Navigation
//
//  Created by Роман on 09.12.2021.

import UIKit
import AVFoundation
import SnapKit

class AudioViewController: UIViewController, AVAudioRecorderDelegate {
    private var audioView = AudioView(frame: UIScreen.main.bounds)
    
    private var iterator: Int = 0
    
    private var player = AVAudioPlayer()
    
    private var userRecordedPlayer = AVAudioPlayer()
    
    private var numberOfRecords = 0
    
    private var recordingSession: AVAudioSession!
    
    private var audioRecorder: AVAudioRecorder!
    
    //MARK: - Lifecycle
    
    override func loadView() {
        self.view = audioView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtonsActions()
        defineAudioAuthorizationStatus()
        prepareForRecording()
        
        do {
            player = try AVAudioPlayer(contentsOf: Songs.songList[iterator].url)
            player.prepareToPlay()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    //MARK: - Target Actions
    
    @objc private func playRecordedSound() {
        
        let path = self.getDirectory().appendingPathComponent("\(self.numberOfRecords).m4a")
        
        do {
            self.userRecordedPlayer = try AVAudioPlayer(contentsOf: path)
            self.userRecordedPlayer.play()
        } catch {
            print("Something went wrong")
        }
    }
    
    @objc private func recordTapped() {
        if audioRecorder == nil {
            numberOfRecords += 1
            startRecording()
        } else {
            finishRecording(success: true)
        }
    }
    
    @objc private func stopTapped() {
        player.stop()
        player.currentTime = 0
    }
    
    @objc private func playTapped() {
        player.play()
        audioView.songNameLabel.text = Songs.songList[iterator].name
    }
    
    @objc private func pauseTapped() {
        player.stop()
    }
    
    @objc private func forwardTapped() {
        if iterator < Songs.songList.count - 1 {
            iterator += 1
            do {
                player = try AVAudioPlayer(contentsOf: Songs.songList[iterator].url)
                player.prepareToPlay()
                player.play()
                audioView.songNameLabel.text = Songs.songList[iterator].name
            } catch {
                print(error)
            }
        } else {
            iterator = 0
            do {
                player = try AVAudioPlayer(contentsOf: Songs.songList[iterator].url)
                player.prepareToPlay()
                player.play()
                audioView.songNameLabel.text = Songs.songList[iterator].name
            } catch {
                print(error)
            }
        }
    }
    
    @objc private func backwardTapped() {
        if iterator > 0 {
            iterator -= 1
            player = try! AVAudioPlayer(contentsOf: Songs.songList[iterator].url)
            player.prepareToPlay()
            player.play()
            audioView.songNameLabel.text = Songs.songList[iterator].name
        } else {
            iterator = Songs.songList.count - 1
            player = try! AVAudioPlayer(contentsOf: Songs.songList[iterator].url)
            player.prepareToPlay()
            player.play()
            audioView.songNameLabel.text = Songs.songList[iterator].name
        }
    }
}

//MARK: - Controller Logic Methods

extension AudioViewController {
    private func setupButtonsActions() {
        audioView.stopButton.addTarget(self, action: #selector(stopTapped), for: .touchUpInside)
        audioView.pauseButton.addTarget(self, action: #selector(pauseTapped), for: .touchUpInside)
        audioView.playButton.addTarget(self, action: #selector(playTapped), for: .touchUpInside)
        audioView.forwardButton.addTarget(self, action: #selector(forwardTapped), for: .touchUpInside)
        audioView.backwardButton.addTarget(self, action: #selector(backwardTapped), for: .touchUpInside)
        audioView.playRecodedButton.addTarget(self, action: #selector(playRecordedSound), for: .touchUpInside)
        audioView.recordButton.addTarget(self, action: #selector(recordTapped), for: .touchUpInside)
    }
    
    private func getDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func startRecording() {
        let audioFilename = getDirectory().appendingPathComponent("\(numberOfRecords).m4a")
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()
            
            audioView.recordButton.setImage(UIImage(systemName: "waveform.circle"), for: .normal)
        } catch {
            finishRecording(success: false)
        }
    }
    
    private func finishRecording(success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil
        
        if success {
            audioView.recordButton.setImage(UIImage(systemName: "record.circle.fill"), for: .normal)
            UserDefaults.standard.set(numberOfRecords, forKey: "myNumber")
        } else {
            finishRecording(success: false)
            print("Record failed")
        }
    }
    
    private func defineAudioAuthorizationStatus() {
        switch AVCaptureDevice.authorizationStatus(for: .audio) {
        case .authorized:
            print("Already have permission")
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .audio) { granted in
                DispatchQueue.main.async {
                    if granted {
                        print("User granted permission to use microphone")
                    }
                }
            }
        case .denied, .restricted:
            break
        @unknown default:
            break
        }
    }
    
    private func prepareForRecording() {
        recordingSession = AVAudioSession.sharedInstance()
        
        if let number: Int = UserDefaults.standard.object(forKey: "myNumber") as? Int {
            numberOfRecords = number
        }
        
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        audioView.loadRecordingUI()
                    } else {
                        print("No permission to record")
                    }
                }
            }
        } catch {
            print("Some error occured")
        }
    }
}
