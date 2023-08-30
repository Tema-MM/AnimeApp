//
//  ImageLoader.swift
//  searchAni
//
//  Created by Makape Tema on 2023/08/02.
//

//import SwiftUI
//import Foundation
//
//
//class ImageLoader: ObservableObject {
//    @Published var image: UIImage?
//    
//    func loadImage(from urlString: String) {
//        guard let url = URL(string: urlString) else {
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let data = data, let loadedImage = UIImage(data: data) {
//                DispatchQueue.main.async {
//                    self.image = loadedImage
//                }
//            }
//        }.resume()
//    }
//}
