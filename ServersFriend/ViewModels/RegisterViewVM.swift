//
//  RegisterViewVM.swift
//  ServersFriend
//
//  Created by Jordan Snow on 3/26/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewVM: ObservableObject {
  @Published var name = ""
  @Published var email = ""
  @Published var password = ""
  @Published var errorMsg = ""
  
  init() {}
  
  func Register() {
    // validation
    guard Utils.validateName(name: name)
    else {
      errorMsg = "Please provide your name, so we know what to call you!"
      return
    }
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
    
    // reset error message to nothing
    if errorMsg.count >= 1 {
      errorMsg = ""
    }
    print("called REGISTER:: ", email, password)
    
    // create user
    Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
      guard let newUserID = result?.user.uid else {
        // TODO: error handling here
        
        return
      }
      // register user
      print("Inserting User into DB")
      self?.insertUserRecord(id: newUserID)
      
      // Database.insertUserRecord(id: newUserID, name: name, email: email)
      // TODO: Figure out the self reference here, and find out why the above
      // TODO: function (from Database) does not work here
    }
  }
  
  private func insertUserRecord(id: String) {
    let newUser = User(
      id: id,
      name: name,
      email: email,
      joined: Date().timeIntervalSince1970
    )
    
    let db = Firestore.firestore()
    
    db.collection("users")
      .document(id)
      .setData(newUser.asDictionary())
  }
}
