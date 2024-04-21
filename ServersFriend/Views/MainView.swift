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
        accountView
      } else {
        LoginView()
      }
    }
  }
  
  @ViewBuilder
  var accountView: some View {
    TabView {
      ServerOverviewView()
        .tabItem {
          Label("Home", systemImage: "house")
        }
      CalendarView()
        .tabItem {
          Label("Calendar", systemImage: "calendar.badge.clock")
        }
      ShiftsView()
        .tabItem {
          Label("Shifts", systemImage: "pencil.line")
        }
      SettingsView()
        .tabItem {
          Label("Settings", systemImage: "gearshape")
        }
    }
  }
}

#Preview {
    MainView()
}
