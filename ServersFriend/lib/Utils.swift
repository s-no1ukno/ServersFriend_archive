//
//  Utils.swift
//  ServersFriend
//
//  Created by Jordan Snow on 3/26/24.
//

import Foundation

class Utils {
  static func validateName(name: String) -> Bool {
    // name validation
    // check that field isn't empty
    guard
      !name.trimmingCharacters(in: .whitespaces).isEmpty
    else {
      return false
    }
    return true
  }
  
  static func validateEmail(email: String) -> Bool {
    // email validation
    // check that field isn't empty
    guard
      !email.trimmingCharacters(in: .whitespaces).isEmpty
    else {
      return false
    }
    // check that email contains "@" and "." characters
    guard
      email.contains("@") && email.contains(".")
    else {
      return false
    }

    return true
  }
  
  static func validatePassword(password: String) -> Bool {
    guard
      !password.trimmingCharacters(in: .whitespaces).isEmpty,
      password.count >= 6
    else {
      return false
    }
    
    return true
  }
}
