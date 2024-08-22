//
//  sss.swift
//  SocialMediaApp
//
//  Created by Surath Chathuranga on 2023-04-13.
//

import SwiftUI

struct sss: View {
    var onPost: (Post)->()
    @State private var postText: String = ""
    @State private var postImageData: Data?
    @AppStorage("user_profile_url") private var profileURL: URL?
    @AppStorage("user_name") private var userName: String = ""
    @AppStorage("user_UID") private var userUID: String = ""
    @Environment(\.dismiss) private var dismiss
    @State private var isLoading: Bool = false
    @State private var errorMessage: String = ""
    @State private var showError: Bool = false
    
    var body: some View {
        VStack{
            HStack{
                Menu{
                    Button("Cancel", role: .destructive){
                        dismiss()
                    }
                }label: {
                    Text("Cancel")
                        .font(.callout)
                        .foregroundColor(.black)
                }
                .hAlign(.leading)

                Button(action: {}){
                    Text("Post")
                        .font(.callout)
                        .foregroundColor(.white)
                        .padding(.horizontal,20)
                        .padding(.vertical,6)
                        .background(.black,in: Capsule())
                }
                .disableWithOpacity(postText == "")
            }

            .padding(.horizontal,15)
            .padding(.vertical,10)
            .background{
                Rectangle()
                    .fill(.gray.opacity(0.05))
                    .ignoresSafeArea()
            }
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15){
                    TextField("What's happening?", text: $postText,axis: .vertical)

                    if let postImageData,let image = UIImage(data: postImageData){
                        GeometryReader{
                            let size = $0.size
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: size.width, height: size.height)
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        }
                        .clipped()
                        .frame(height: 220)
                    }
                }
                .padding(15)
            }
            Divider()

            HStack{
                Button{

                }label: {
                    Image(systemName: "Photo.on.rectangle")
                        .font(.title3)
                }
                .hAlign(.leading)

                Button("Done"){

                }
            }
            .foregroundColor(.black)
            .padding(.horizontal,15)
            .padding(.vertical,10)

        }
        .vAlign(.top)

    }
}

struct sss_Previews: PreviewProvider {
    static var previews: some View {
        sss{_ in
            
        }
    }
}
