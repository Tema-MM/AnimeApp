//
//  searchAniApp.swift
//  searchAni
//
//  Created by Makape Tema on 2023/08/01.
//

import SwiftUI

@main
struct searchAniApp: App {
    let favoritesManager = FavoritesManager()
    
    var body: some Scene {
        WindowGroup {
           MainView()
                .environmentObject(favoritesManager)
        }
    }
}
