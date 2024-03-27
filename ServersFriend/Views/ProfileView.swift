//
//  ProfileView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 3/27/24.
//

import SwiftUI

struct ProfileView: View {
  @StateObject var viewModel = ProfileViewVM()
  
  var body: some View {
    NavigationView {
      VStack {
        if let user = viewModel.user {
          profile(user: user)
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
    Image(systemName: "person.circle")
      .resizable()
      .aspectRatio(contentMode: .fit)
      .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
      .frame(width: 125, height: 125)
      .padding()
    
    // Info: name, email, member since
    VStack(alignment: .leading) {
      HStack {
        Text("Name: ")
          .bold()
        Text(user.name)
      }
      .padding()
      HStack {
        Text("Email: ")
          .bold()
        Text(user.email)
      }
      .padding()
      HStack {
        Text("Member since: ")
          .bold()
        Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
      }
      .padding()
    }
    .padding()
    
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
    ProfileView()
}
