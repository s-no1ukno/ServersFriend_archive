//
//  SettingsView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/21/24.
//

import SwiftUI

struct SettingsView: View {
  var body: some View {
    NavigationStack {
      VStack {
        Text("Settings View")
          .font(.title)
      }
      .navigationTitle("Settings")
    }
  }
}

#Preview {
  SettingsView()
}
