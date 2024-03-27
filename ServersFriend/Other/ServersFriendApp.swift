//
//  ServersFriendApp.swift
//  ServersFriend
//
//  Created by Jordan Snow on 3/7/24.
//

import SwiftUI
import FirebaseCore

@main
struct ServersFriendApp: App {
  init() {
    FirebaseApp.configure()
  }
  
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
