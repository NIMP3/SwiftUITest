//
//  NotificationView.swift
//  WatchLandmarks Watch App
//
//  Created by Edwin Yovany on 8/02/24.
//

import SwiftUI

struct NotificationView: View {
    var title: String?
    var message: String?
    var landmark: Landmark?
    
    var body: some View {
        VStack {
            if let landmark {
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
            }
            
            Text(title ?? "Unknow Landmark")
                .font(.headline)
            
            Divider()
            
            Text(message ?? "You are within 5 miles of one of your favorite landmarks.")
                .font(.caption)
        }
    }
}

#Preview {
    let modelData = ModelData()
    let landmark = modelData.landmarks[0]
    
    return NotificationView(
        title: landmark.name,
        message: "You are within 5 miles of \(landmark.name).",
        landmark: landmark)
}
