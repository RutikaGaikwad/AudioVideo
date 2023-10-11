//
//  ViewController.swift
//  AudioVideo
//
//  Created by APPLE on 08/10/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var audioPlayer = AVAudioPlayer()
    var player = AVPlayer()
    var layer = AVPlayerLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func startAudio(_ sender: UIButton) {
        guard let url = Bundle.main.url(forResource: "Suzume audio", withExtension: "mp3") else {return}
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func stopAudio(_ sender: UIButton) {
        audioPlayer.stop()
    }
    
    
    @IBAction func startVideo(_ sender: UIButton) {
        guard let url = Bundle.main.url(forResource: "suzume video", withExtension: "mp4") else {return}
        player = AVPlayer(url: url)
        layer = AVPlayerLayer(player: player)
        layer.frame = view.bounds
        view.layer.addSublayer(layer)
        player.play()
    }
    
    
    @IBAction func stopVideo(_ sender: UIButton) {
        player.pause()
        layer.removeFromSuperlayer()
    }
}
