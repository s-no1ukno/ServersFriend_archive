//
//  MainViewVM.swift
//  ServersFriend
//
//  Created by Jordan Snow on 3/26/24.
//

import Foundation
import FirebaseAuth

class MainViewVM: ObservableObject {
  @Published var currentUserID: String = ""
  private var handler: AuthStateDidChangeListenerHandle?
  
  init() {
    self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
      DispatchQueue.main.async {
        self?.currentUserID = user?.uid ?? ""
      }
    }
  }
  
  public var isSignedIn: Bool {
    return Auth.auth().currentUser != nil
  }
}
