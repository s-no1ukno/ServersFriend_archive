//
//  ProfileView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 3/27/24.
//

import SwiftUI

struct ProfileView: View {
  @StateObject var viewModel = ProfileViewVM()
  @State var currentUserID: String
  
  init(userID: String) {
    self.currentUserID = userID
  }
  
  var body: some View {
    NavigationView {
      VStack {
        if let user = viewModel.user {
          profile(user: user)
          SettingsView(userID: currentUserID)
        } else {
          Text("Loading user info...")
        }
      }
      .navigationTitle("Profile")
    }
    .onAppear {
      viewModel.fetchUser()
    }
  }
  
  @ViewBuilder
  func profile(user: User) -> some View {
    // avatar
    HStack {
      Image(systemName: "person.circle")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        .frame(width: 50, height: 50)
        .padding(.horizontal, 50)
      Spacer()
    }
    
    // Info: name, email, member since
    VStack(alignment: .leading) {
      HStack {
        Text("Name: ")
          .bold()
        Text(user.name)
      }
      HStack {
        Text("Email: ")
          .bold()
        Text(user.email)
      }
      HStack {
        Text("Member since: ")
          .bold()
        Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
      }
    }
    
    // signout button
    Button ("Logout") {
      viewModel.logout()
    }
    .buttonStyle(BorderedButtonStyle())
    .tint(.red)
    .padding()
    Spacer()
  }
}

#Preview {
  ProfileView(userID: "io741v5yxYPiRveSiqfnGdjKch82")
}
