//
//  ContentView.swift
//  Recipe App
//
//  Created by Surath Chathuranga on 2023-06-13.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseFirestore

struct LoginView: View {
    @State var emailid: String = ""
    @State var password: String = ""
    @State var createAccount: Bool = false
    @State var showError: Bool = false
    @State var errorMessage: String = ""
    @State var isLoading: Bool = false
    @AppStorage("log_status") var logStatus: Bool = false
    @AppStorage("user_profile_url") var profileURL: URL?
    @AppStorage("user_name") var userNameStored: String = ""
    @AppStorage("user_UID") var userUID: String = ""
    var body: some View {
        VStack(spacing: 10){
            Image("loginimage")
                .resizable()
                .scaledToFit()
            
            Text("Login")
                .font(.largeTitle.bold())
                .hAlign(.center)
            
            
            Text("Welcome Back")
                .font(.title3)
                .hAlign(.center)
            
            VStack(spacing: 12){
                TextField("Email", text: $emailid)
                    .textContentType(.emailAddress)
                    .border(1, .gray.opacity(0.5))
                    .padding(.top,25)
                
                SecureField("Password", text: $password)
                    .textContentType(.emailAddress)
                    .border(1, .gray.opacity(0.5))
                
                Button("Reset Password?", action: resetPassword)
                    .font(.callout)
                    .fontWeight(.medium)
                    .tint(.black)
                    .hAlign(.trailing)
                
                Button(action: loginUser){
                    Text("Sign In")
                        .foregroundColor(.white)
                        .hAlign(.center)
                        .fillView(.black)
                }
                .padding(.top, 10)

            }
            HStack{
                Text("Don't have an account?")
                    .foregroundColor(.gray)
                
                Button("Register Now"){
                    createAccount.toggle()
                    
                }
                .fontWeight(.bold)
                .foregroundColor(.black)
            }
            .font(.callout)
            .vAlign(.bottom)
            
        }
                .vAlign(.top)
                .padding(15)
                .overlay(content: {
                    LoadingView(show: $isLoading)
                })
                .fullScreenCover(isPresented: $createAccount){
                    RegisterView()
                }
                .alert(errorMessage, isPresented: $showError, actions: {})
    }
    func loginUser(){
        isLoading = true
        closeKeyboard()
        Task{
            do{
                try await Auth.auth().signIn(withEmail: emailid, password: password)
                print("User Found")
                try await fetchUser()
            }catch{
                await setError(error)
            }
        }
    }
    func fetchUser()async throws{
        guard let userID = Auth.auth().currentUser?.uid else{return}
        let user = try await Firestore.firestore().collection("User").document(userID).getDocument(as: User.self)
        await MainActor.run(body: {
            userNameStored =  user.username
            userUID = userID
            profileURL = user.userProfileURL
            logStatus = true
        })
    }
    
    
    func resetPassword(){
        Task{
            do{
                try await Auth.auth().sendPasswordReset(withEmail: emailid)
                print("Link Sent")
            }catch{
                await setError(error)
            }
        }
    }
    func setError(_ error: Error)async{
        await MainActor.run(body: {
            errorMessage = error.localizedDescription
            showError.toggle()
            isLoading = false
        })
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


