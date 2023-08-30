import SwiftUI

struct ContentView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    @ObservedObject private var viewModel = AnimeViewModel()
    @State private var searchText = ""
    
    @State private var isShowingSheet = false
    
    @State private var selectedAnime: Datum?
    @State private var randomImageUrls: [String] = []
    @State private var showAlert = false
    @State private var imageModels: [ImageModel] = []
    
//    let theGenres = ["Horror", "Action", "Romance", "SciFi", "Genre", "Genre1"]
    
    @State private var currentIndex = 0
    
    var body: some View {
        VStack {
            VStack {
                AsyncImage(url: URL(string: LargeImageURLs.urls[currentIndex])) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(12)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    Divider()
                } placeholder: {
                    Color.gray
                }
//                .frame(width: 475, height: 500)
                .padding(.top, -300)
                .onAppear {
                    startImageCarousel()
                }
            }
            Spacer()
            
            VStack(alignment: .leading) {
                Text("You may also like!")
//                    .padding()
                    .padding(.leading, 25)
                    .fontWeight(.bold)
                    .font(.title2)
                
                
//                Divider()
                
//                ScrollView(.horizontal, showsIndicators: false) {
//                                    HStack(spacing: 10) {
//                                        if let genres = selectedAnime?.genres {
//                                            ForEach(genres, id: \.malID) { genre in
//                                                Text(genre.name ?? "")
//                                                    .padding(.vertical, 8)
////                                                    .padding(.horizontal, 16)
//                                                    .background(Color.blue)
//                                                    .foregroundColor(.white)
//                                                    .cornerRadius(12)
//                                            }
//                                        }
//                                    }
////                    .padding(.leading)
//                }
//                .padding(.top, 1)
                Divider()

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(LargeImageURLs.urls, id: \.self) { imageUrl in
                            ZStack {
                                RemoteImageView(imageUrl: imageUrl)
                                    .border(.gray)
                                    .frame(width: 100, height: 130)
                                    .cornerRadius(15)
                                
                                Button(action: {
                                    showAlert = true
                                }) {
                                    Color.clear
                                }
                                .frame(width: 100, height: 130)
                                .alert(isPresented: $showAlert) {
                                    Alert(
                                        title: Text("what to know ❤️‍🔥"),
                                        message: Text("The main characters are Spike Spiegel, Jet Black, Faye Valentine, Edward Wong, and their loyal dog Ein. he show is set in the year 2071 and follows a group of bounty hunters, known as cowboys, as they travel through space in their spaceship, the Bebop. "),
                                        dismissButton: .default(Text("OK"))
                                    )
                                }

                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                Divider()
            }
        }
        .padding(.top, 330)
    }
    
    func doSearch() {
        viewModel.searchAnime()
    }
    
    private func startImageCarousel() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
            withAnimation {
                currentIndex = (currentIndex + 1) % LargeImageURLs.urls.count
            }
        }
    }
    
    private func performSearch() {
        viewModel.searchAnime()
    }
}

struct CollectionView: View {
    let imageModels: [ImageModel]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(imageModels, id: \.self) { imageModel in
                    if let imageUrl = imageModel.imageURL, !imageUrl.isEmpty {
                        RemoteImageView(imageUrl: imageUrl)
                            .frame(width: 150, height: 150)
                            .cornerRadius(12)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

struct LargeImageURLs {
    static let urls: [String] = [
        "https://cdn.myanimelist.net/images/anime/13/5171l.jpg",
        "https://cdn.myanimelist.net/images/anime/6/14331l.jpg",
        "https://cdn.myanimelist.net/images/anime/10/74089l.jpg",
        "https://cdn.myanimelist.net/images/anime/10/80113l.jpg",
        "https://cdn.myanimelist.net/images/anime/1185/92795l.jpg",
        "https://cdn.myanimelist.net/images/anime/1439/93480l.jpg",
        "https://cdn.myanimelist.net/images/anime/1018/120197l.jpg",
        "https://cdn.myanimelist.net/images/anime/7/3791l.jpg",
        "https://cdn.myanimelist.net/images/anime/12/19609l.jpg",
        "https://cdn.myanimelist.net/images/anime/4/19644l.jpg",
        "https://cdn.myanimelist.net/images/anime/4/22882l.jpg",
        "https://cdn.myanimelist.net/images/anime/12/22883l.jpg",
        "https://cdn.myanimelist.net/images/anime/6/22885l.jpg",
        "https://cdn.myanimelist.net/images/anime/11/53939l.jpg",
        "https://cdn.myanimelist.net/images/anime/2/78836l.jpg",
        "https://cdn.myanimelist.net/images/anime/12/69601l.jpg",
        "https://cdn.myanimelist.net/images/anime/12/81920l.jpg",
        "https://cdn.myanimelist.net/images/anime/1519/91488l.jpg",
        "https://cdn.myanimelist.net/images/anime/1764/109632l.jpg",
        "https://cdn.myanimelist.net/images/anime/1952/121242l.jpg",
        "https://cdn.myanimelist.net/images/anime/1623/122582l.jpg"
    ]
}

struct RemoteImageView: View {
    let imageUrl: String
    
    @State private var image: UIImage?
    @State private var showAlert = false
    
    var body: some View {
        Group {
            
            
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture {
                    showAlert = true
                  }
                    .overlay(
                        Image(systemName: "info.circle.fill")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.leading, 65)
                            .padding(.top, 100)
                    )
                
            } else {
                
                                    
                Color.gray
                    .onAppear {
                        fetchImage()
                    }
            }
        }
    }
    
    private func fetchImage() {
        if let url = URL(string: imageUrl) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data, let fetchedImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = fetchedImage
                    }
                }
            }.resume()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
    }
}
