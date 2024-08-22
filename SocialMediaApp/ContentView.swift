//
//  ContentView.swift
//  SocialMediaApp
//
//  Created by Surath Chathuranga on 2023-04-12.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("log_status") var logStatus: Bool = false
    var body: some View {
        //MARK: Redirecting User Based on log status
        if logStatus{
            MainView()
        }else{
            LoginView()
        }
   
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
