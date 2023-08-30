//
//  ImageCarouselView.swift
//  searchAni
//
//  Created by Makape Tema on 2023/08/03.
//

import SwiftUI

//struct ImageCarouselView: View {
//    let imageUrls: [String]
//    @Binding var currentIndex: Int
//
//    var body: some View {
//        TabView(selection: $currentIndex) {
//            ForEach(imageUrls.indices, id: \.self) { index in
//                RemoteImageView(imageUrl: imageUrls[index])
//                    .tag(index)
//            }
//        }
//        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//        .onAppear(perform: startImageCarousel)
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


//
//struct ImageCarouselView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageCarouselView()
//    }
//}
