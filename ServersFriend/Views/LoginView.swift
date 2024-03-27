//
//  LoginView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 3/26/24.
//

import SwiftUI

struct LoginView: View {
  @StateObject var viewModel = LoginViewVM()
  
  var body: some View {
    NavigationView {
      VStack {
        // let's do a header here
        Header(
          title: "Server's Friend",
          subtitle: "The greatest companion for Servers",
          angle: 15,
          color: .blue
        )
        
        // login form
        Form {
          // errors?
          if !viewModel.errorMsg.isEmpty {
            Text(viewModel.errorMsg)
              .foregroundColor(.red)
          }
          // email and password fields
          TextField("Email", text: $viewModel.email)
            .autocapitalization(.none)
          SecureField("Password", text: $viewModel.password)
          
          // login button
          TLButton(title: "Login", color: .blue) {
            viewModel.Login()
          }
        }
        .offset(y: -50)
        
        // Create account button
        VStack {
          Text("New around here?")
          NavigationLink("Create Account Now", destination: RegisterView())
        }
        .padding(.bottom, 50)
        
        Spacer()
      }
    }
  }
}

#Preview {
    LoginView()
}
