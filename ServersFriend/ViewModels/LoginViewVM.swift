//
//  LoginViewVM.swift
//  ServersFriend
//
//  Created by Jordan Snow on 3/26/24.
//

import Foundation
import FirebaseAuth

class LoginViewVM: ObservableObject {
  @Published var email = ""
  @Published var password = ""
  @Published var errorMsg = ""
  
  init() {}
  
  func Login() {
    // attempt login functionality
    guard Utils.validateEmail(email: email)
    else {
      errorMsg = "Please provide valid email"
      return
    }
    guard Utils.validatePassword(password: password)
    else {
      errorMsg = "Please ensure password is longer that six characters"
      return
    }
    
    if errorMsg.count >= 1 {
      errorMsg = ""
    }
    
    // try login
    Auth.auth().signIn(withEmail: email, password: password)
    print("called LOGIN:: ", email, password)
  }
}


