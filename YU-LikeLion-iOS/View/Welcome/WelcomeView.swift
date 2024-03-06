//
//  WelcomeView.swift
//  YU-LikeLion-iOS
//
//  Created by 윤강록 on 1/28/24.
//

import SwiftUI
import AuthenticationServices

struct WelcomeView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Image("LikeLionLogo")
                    .frame(width: 360.0, height: 60)
                
                Text("Possibility to Reality")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hue: 0.072, saturation: 0.945, brightness: 0.977))
                
            }
            Spacer()
            VStack {
                AppleSigninButton()
            }
            .padding(20)
            Text("YU LIKELION")
                .fontWeight(.semibold)
        }
    }
}

struct AppleSigninButton: View {
    
    @StateObject private var loginData = LoginViewModel()
    
    var body: some View {
        SignInWithAppleButton { (request) in
            loginData.nonce = randomNonceString()
            request.requestedScopes = [.email, .fullName]
            request.nonce = sha256(loginData.nonce)
            
        } onCompletion: { (result) in
            switch result {
            case .success(let user):
                print("success")
                guard let credential = user.credential as? ASAuthorizationAppleIDCredential else {
                    print("error with firebase")
                    return
                }
                loginData.authenticate(credential: credential)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        .frame(width : UIScreen.main.bounds.width * 0.9, height:58)
        .cornerRadius(10)
        //        .padding()
    }
}

#Preview {
    WelcomeView()
}

