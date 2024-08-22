//
//  SearchUserView.swift
//  SocialMediaApp
//
//  Created by Surath Chathuranga on 2023-04-14.
//

import SwiftUI
import FirebaseFirestore

struct SearchUserView: View {
    @State private var fetchedUsers: [User] = []
    @State private var searchText: String = ""
    @Environment(\.dismiss) private var dissmiss
    var body: some View {
            List{
                ForEach(fetchedUsers){user in
                    NavigationLink{
                        ReusableProfileContent(user: user)
                    }label: {
                        Text(user.username)
                            .font(.callout)
                            .hAlign(.leading)
                    }
                }
            }
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Serach User")
            .searchable(text: $searchText)
            .onSubmit(of: .search, {
                //Fetch user from firebase
                Task{await searchUsers()}
            })
            .onChange(of: searchText, perform: { newValue in
                if newValue.isEmpty{
                    fetchedUsers = []
                }
            })
        }
    func searchUsers()async{
        do{
          
            
            let documents = try await Firestore.firestore().collection("User")
                .whereField("username", isGreaterThanOrEqualTo: searchText)
                .whereField("username", isLessThanOrEqualTo: "\(searchText)\u{f8ff}")
                .getDocuments()
            
            let users = try documents.documents.compactMap{ doc -> User? in
                try doc.data(as: User.self)
            }
            
            await MainActor.run(body: {
                fetchedUsers = users
            })
            
        }catch{
            print(error.localizedDescription)
        }
    }
}

struct SearchUserView_Previews: PreviewProvider {
    static var previews: some View {
        SearchUserView()
    }
}
