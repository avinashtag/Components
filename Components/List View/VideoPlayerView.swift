//
//  VideoPlayerView.swift
//  Components
//
//  Created by Avinash on 14/11/2024.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var body: some View {
        if let url = URL(string: "https://apivideo-demo.s3.amazonaws.com/hello.mp4"){
            VideoPlayer(player: AVPlayer(url: url))
                .ignoresSafeArea()

        }
    }
}

#Preview {
    VideoPlayerView()
}
