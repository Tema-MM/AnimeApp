import Foundation

class FavoritesManager: ObservableObject {
    static let shared = FavoritesManager()
    
    @Published var favoriteTitles: [String] = []
    @Published var favorites: [Datum] = []
    
    func addFavorite(_ anime: Datum) {
        if !favorites.contains(anime) {
            favorites.append(anime)
        }
    }
    
    func removeFavorite(_ anime: Datum) {
        if let index = favorites.firstIndex(where: { $0.id == anime.id }) {
            favorites.remove(at: index)
        }
    }
}
