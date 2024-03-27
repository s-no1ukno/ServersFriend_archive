//
//  RegisterView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 3/26/24.
//

import SwiftUI

struct RegisterView: View {
  @StateObject var viewModel = RegisterViewVM()
  
  var body: some View {
    NavigationView {
      VStack {
        // let's do a header here
        Header(
          title: "Server's Friend",
          subtitle: "The greatest companion for Servers",
          angle: -15,
          color: .red
        )
        
        // login form
        Form {
          // errors?
          if !viewModel.errorMsg.isEmpty {
            Text(viewModel.errorMsg)
              .foregroundColor(.red)
          }
          // email and password fields
          TextField("Name", text: $viewModel.name)
            .autocorrectionDisabled()
          TextField("Email", text: $viewModel.email)
            .autocapitalization(.none)
          SecureField("Password", text: $viewModel.password)
          
          // login button
          TLButton(title: "Register", color: .blue) {
            print("clicked")
            viewModel.Register()
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
    RegisterView()
}
