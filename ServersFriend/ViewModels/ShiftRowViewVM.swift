//
//  ShiftRowViewVM.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/15/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ShiftRowViewVM: ObservableObject {
  
  func editShift (id: String, updatedShift: Shift) {
    return
  }
  
  func deleteShift (id: String) {
    guard let currentUserID = Auth.auth().currentUser?.uid else {
      print("Need error handling cuz u a dumbass!!")
      return
    }
    let db = Firestore.firestore()
    
    db.collection("users")
      .document(currentUserID)
      .collection("shifts")
      .document(id)
      .delete()
  }
}
