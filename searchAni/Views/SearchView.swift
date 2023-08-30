import SwiftUI

struct SearchView: View {
    @ObservedObject private var viewModel = AnimeViewModel()
    @State private var searchText = ""
    @State private var isShowingSheet = false
    
    @State private var selectedAnime: Datum? = nil
    @State private var selectedAnimeImage: ImageModel? = nil
    
    let theImages = ["naruto", "pokemom", "dbz", "dms", "1piece", "1punch", "beach", "image1"]
    
    var imageName = "naruto"
    
    @State private var currentIndex = 0
    
    var body: some View {
        VStack {
            VStack {
                Text("Search")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Divider()
                
                // Search Bar
                ZStack(alignment: .trailing) {
                    TextField("Search Anime", text: $viewModel.searchText, onCommit: {
                        viewModel.searchAnime()
                    })
                    .border(.black)
                    .cornerRadius(9)
                    .padding(.horizontal)
                    .textFieldStyle(.roundedBorder)
                    .padding(.top, 50)
                    .padding(.horizontal, 10)
                    
                    // Clear Button
                    if !viewModel.searchText.isEmpty {
                        Button(action: {
                            viewModel.searchText = "" // Clear the search text
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                                .padding(.top, 4)
                        }
                    }
                }
                Spacer()
                
                // Ssearch results
                                if let animeData = viewModel.animeData, let animeList = animeData.data {
                                    List(animeList, id: \.malID) { anime in
                                        Text(anime.title ?? "Unknown Title")
                                            .onTapGesture {
                                                selectedAnime = anime
                                                selectedAnimeImage = anime.images?["jpg"]
                                            }
            }
                                .popover(item: $selectedAnime) { anime in
                                    AnimeDetailView(anime: anime, animeImage: selectedAnimeImage)
                                }
            
//            if let animeData = viewModel.animeData, let animeList = animeData.data {
//                List(animeList, id: \.malID) { anime in
//                    Text(anime.title ?? "Unknown Title")
//                        .onTapGesture {
//                            selectedAnime = anime
//                            selectedAnimeImage = anime.images?["jpg"]
//                        }
//                        .background(NavigationLink("", destination: AnimeDetailView(anime: anime, animeImage: selectedAnimeImage))
//                            .opacity(0))
//                }
                } else {
                    //                    Text("No results found")
                }
            }
            
        }
        
        
    }
    
    private func startImageCarousel() {
        Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { timer in
            withAnimation {
                currentIndex = (currentIndex + 1) % LargeImageURLs.urls.count
            }
        }
    }
}


// Mark: My structs
struct SearchResultsSheet: View {
    var animeList: [Datum]
    @Binding var isShowingSheet: Bool
    
    var body: some View {
        NavigationView {
            List(animeList, id: \.malID) { anime in
                Text(anime.title ?? "Unknown Title")
            }
            .navigationTitle("Search Results")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        isShowingSheet = true // Dismiss the sheet
                    }
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
