//
//  CarouselView.swift
//  searchAni
//
//  Created by Makape Tema on 2023/08/03.
//

import SwiftUI

// Create a CarouselView to display images
//struct CarouselView: View {
//    let imageUrls: [String]
//    @State private var currentIndex = 0
//    
//    var body: some View {
//        GeometryReader { geometry in
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: 0) {
//                    ForEach(imageUrls.indices, id: \.self) { index in
//                        RemoteImageView(imageUrl: imageUrls[index])
//                            .frame(width: geometry.size.width, height: 200)
//                    }
//                }
//            }
//            .content.offset(x: CGFloat(currentIndex) * -geometry.size.width)
//            .frame(width: geometry.size.width, height: 200, alignment: .leading)
//            .onAppear {
//                startImageCarousel()
//            }
//        }
//    }
//
//    private func startImageCarousel() {
//        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
//            withAnimation {
//                currentIndex = (currentIndex + 1) % imageUrls.count
//            }
//        }
//    }
//}


//struct CarouselView_Previews: PreviewProvider {
//    static var previews: some View {
//        CarouselView()
//    }
//}
