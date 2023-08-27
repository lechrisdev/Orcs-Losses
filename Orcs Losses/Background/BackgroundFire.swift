//
//  BackgroundFire.swift
//  Orcs Losses
//
//  Created by Le Chris on 27.08.2023.
//

import SwiftUI
import AVKit

struct BackgroundFire: View {
    
    var withVideo: Bool
    
    init(withVideo: Bool = true) {
        self.withVideo = withVideo
    }
    
    var body: some View {
        ZStack {
            Color("bgColor")
            if withVideo, let url = Bundle.main.url(forResource: "FireSparks", withExtension: "mp4") {
                FullscreenVideoPlayer(videoURL: url)
                    .disabled(true)
                    .scaledToFill()
                    .opacity(0.5)
            }

                FireCircle(color: .red)
                FireCircle(color: .orange)
                FireCircle(color: .red)
                FireCircle(color: .orange)
                FireCircle(color: .red)
                FireCircle(color: .orange)
                FireCircle(color: .red)
                FireCircle(color: .orange)
        }
    }
}

struct BackgroundFire_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundFire()
    }
}

struct FireCircle: View {
    
    var color: Color
    @State var offsetX: CGFloat = 0
    @State var offsetY: CGFloat = -200
    @State var opacity: Double = 0
    
    var body: some View {
        ZStack {
            Ellipse()
                .rotation(Angle(degrees: Double.random(in: -20...20)) )
                .frame(width: 150, height: 250)
                .blur(radius: 100)
                .foregroundColor(color)
                .offset(x: offsetX, y: offsetY)
                .opacity(opacity)
        }.onAppear {
            randomizePosition()
            randomizeOpacity()
        }
    }
    
    func randomizePosition() {
        let randomOffsetX = CGFloat.random(in:-500...500)
        withAnimation(Animation.easeInOut(duration: 6)) {
            offsetX = randomOffsetX
        }
        
        let randomOffsetY = CGFloat.random(in: -500...(-200))
        withAnimation(Animation.easeInOut(duration: 6)) {
            offsetY = randomOffsetY
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.randomizePosition()
        }
    }
    
    func randomizeOpacity() {
        let randomOpacity = Double.random(in: 0.7...1)
        withAnimation(Animation.easeInOut(duration: 0.2)) {
            opacity = randomOpacity
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.randomizeOpacity()
        }
    }
}
