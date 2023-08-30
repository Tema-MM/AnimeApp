import SwiftUI
import Foundation


class AnimeViewModel: ObservableObject {
    @Published var animeData: AnimesModel?
    @Published var searchText = ""
    @Published var carouselImageURLs: [String] = []
    
    @Published var urlImages: [String: ImageModel] = [:]
        
    func searchAnime() {
        guard let searchingAnime = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }

        let apiURL = "https://api.jikan.moe/v4/anime?q=\(searchingAnime)"

        guard let url = URL(string: apiURL) else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let data = data else {
                return
            }

            do {
                let decoder = JSONDecoder()
                let animeModel = try decoder.decode(AnimesModel.self, from: data)
                

                DispatchQueue.main.async {
                    self.animeData = animeModel
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
}



