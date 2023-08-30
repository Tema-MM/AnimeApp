import SwiftUI

struct AnimeDetailView: View {
    @State private var isFavorite = false
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    let anime: Datum
    let animeImage: ImageModel?
    
    var body: some View {
        VStack {
            Button(action: {
                isFavorite.toggle()
                if isFavorite {
                    favoritesManager.addFavorite(anime)
                    print("Added to favorites list:", anime.title ?? "Unknown Title")
                } else {
                    favoritesManager.removeFavorite(anime)
                    print("Removed from favorites list:", anime.title ?? "Unknown Title")
                }
            }) {
                Image(systemName: isFavorite ? "star.circle.fill" : "star")
                    .padding()
                    .padding(.leading, 350)
            }
            .controlSize(.large)

            Text(anime.title ?? "Unknown Title")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            if let imageURL = animeImage?.imageURL, let url = URL(string: imageURL) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .cornerRadius(12)
                        .frame(width: 350, height: 300)
                } placeholder: {
                    Color.gray
                }
                .padding()
            }
            
            //            if let source = anime.source {
            //                Text("Source: \(source)")
            //            }
//            
            ScrollView() {
                if let synopsis = anime.synopsis {
                    Text("About:\n\n\(synopsis)")
                        .font(.headline)
                        .padding()
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                }
            }
        }
        .padding()
    }
}
