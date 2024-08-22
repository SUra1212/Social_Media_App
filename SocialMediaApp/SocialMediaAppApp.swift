//
//  SocialMediaAppApp.swift
//  SocialMediaApp
//
//  Created by Surath Chathuranga on 2023-04-12.
//

import SwiftUI
import Firebase

@main
struct SocialMediaAppApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
