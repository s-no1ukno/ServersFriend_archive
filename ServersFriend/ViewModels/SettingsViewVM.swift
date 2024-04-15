//
//  SettingsViewVM.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/11/24.
//

import Foundation
import FirebaseFirestore

class SettingsViewVM: ObservableObject {
  @Published var showingNewShiftTypeView: Bool = false
  
  private let userID: String
  
  init(userID: String) {
    self.userID = userID
  }
  
  func deleteShift (id: String) {
    let db = Firestore.firestore()
    
    db.collection("users")
      .document(userID)
      .collection("shifts")
      .document(id)
      .delete()
  }
}
