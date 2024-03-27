//
//  Database.swift
//  ServersFriend
//
//  Created by Jordan Snow on 3/27/24.
//

import Foundation
import FirebaseFirestore

class Database {
  static func insertUserRecord(id: String, name: String, email: String) {
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
