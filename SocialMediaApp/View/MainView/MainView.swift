//
//  MainView.swift
//  SocialMediaApp
//
//  Created by Surath Chathuranga on 2023-04-13.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        //MARK: TabView with recent post's and profile tabs
        TabView{
            PostsView()
                .tabItem{
                    Image(systemName: "rectangle.portrait.on.rectangle.portrait.angled")
                    Text("Post's")
                }
            ProfileView()
                .tabItem{
                    Image(systemName: "gear")
                    Text("Profile")
                }
        }
        //changiing tab label tint to black
        .tint(.black)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
