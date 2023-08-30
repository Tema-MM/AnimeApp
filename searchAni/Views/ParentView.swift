import SwiftUI

struct ParentView: View {
    @StateObject private var favoritesManager = FavoritesManager.shared // Initialize the FavoritesManager
    
    var body: some View {
        ContentView()
            .environmentObject(favoritesManager) // Pass the manager to ContentView and its child views
    }
}
