//
//  PlaySound.swift
//  Honeymoon
//
//  Created by Aleksandrs Petruhins on 05/08/2022.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: "mp3") {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }
}
