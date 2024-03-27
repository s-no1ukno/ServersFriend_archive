//
//  LoginViewVM.swift
//  ServersFriend
//
//  Created by Jordan Snow on 3/26/24.
//

import Foundation

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
    print("called LOGIN:: ", email, password)
    // register user
  }
}


