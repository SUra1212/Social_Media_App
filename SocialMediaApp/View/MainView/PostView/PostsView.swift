//
//  PostsView.swift
//  SocialMediaApp
//
//  Created by Surath Chathuranga on 2023-04-14.
//

import SwiftUI

struct PostsView: View {
    @State private var  recentPosts: [Post] = []
    @State private var createNewPost: Bool = false
    var body: some View {
        NavigationStack{
//            Image("InstaName")
//                .resizable()
//                .frame(width: 230, height: 100)
                //.scaledToFit()
            
            ReusablePostsView(posts: $recentPosts)
                .hAlign(.center).vAlign(.center)
                .overlay(alignment: .bottomTrailing) {
                    Button{
                        createNewPost.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(13)
                            .background(.black,in: Circle())
                    }
                    .padding(15)
                }
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing){
                        NavigationLink{
                            SearchUserView()
                        } label: {
                           
                            Image(systemName: "magnifyingglass")
                                .tint(.black)
                                .scaleEffect(0.9)
                        }
                        
                    }
                    
                })
                .navigationTitle("Post's")
        }

            .fullScreenCover(isPresented: $createNewPost){
                CreateNewPost { post in
                    // Adding created post at the top of the recent posts
                    recentPosts.insert(post, at: 0)
                    
                }
            }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
