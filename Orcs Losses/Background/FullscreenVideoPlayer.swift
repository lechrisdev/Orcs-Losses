//
//  FullscreenVideoPlayer.swift
//  Orcs Losses
//
//  Created by Le Chris on 27.08.2023.
//

import SwiftUI
import AVKit

struct FullscreenVideoPlayer: View {
    private var player: AVPlayer
    
    init(videoURL: URL) {
        player = AVPlayer(url: videoURL)
        player.play()
    }
    
    var body: some View {
        VideoPlayer(player: player)
        .onAppear {
            player.play()
            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: nil, queue: .main) { _ in
                player.seek(to: .zero)
                player.play()
            }
            
        }
    }
}
