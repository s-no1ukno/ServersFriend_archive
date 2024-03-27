//
//  ContentView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 3/7/24.
//

import SwiftUI

struct MainView: View {
  @StateObject var viewModel = MainViewVM()
  
  var body: some View {
    VStack {
      if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty {
        ServerOverviewView()
      } else {
        LoginView()
      }
    }
  }
}

#Preview {
    MainView()
}
