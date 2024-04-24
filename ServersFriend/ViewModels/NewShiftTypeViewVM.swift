//
//  NewShiftTypeViewVM.swift
//  ServersFriend
//
//  Created by Jordan Snow on 3/28/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewShiftTypeViewVM: ObservableObject {
  @Published var shiftTypeName = ""
  @Published var decimalString = ""
  @Published var hourlyWage = 0.0
  @Published var tipIn = false
  @Published var tipOut = false
//  @Published var employer = ""
  
  @Published var errorMsg = ""

  func createNewShiftType() -> Void {
    // get current userID
    guard let currentUserID = Auth.auth().currentUser?.uid else {
      return
    }
    guard canSave else {
      return
    }
    hourlyWage = Double(decimalString) ?? 0.00
    
    // Create new model
    let newID = UUID().uuidString
    let newShift = Shift(
      id: newID,
      nameOfShift: shiftTypeName,
      hourlyWage: hourlyWage,
      tipIn: tipIn,
      tipOut: tipOut
//      employer: employer
    )
    
    let db = Firestore.firestore()
    db.collection("users")
      .document(currentUserID)
      .collection("shifts")
      .document(newID)
      .setData(newShift.asDictionary())
    
    if !errorMsg.isEmpty {
      errorMsg = ""
    }
  }
  
  
  
  var canSave: Bool {
    // validation for saving here
    // check that shiftType is not empty
    guard !shiftTypeName.trimmingCharacters(in: .whitespaces).isEmpty else {
      errorMsg = "Please add a name for your shift."
      return false
    }
    
    // check that decimalString is not empty
    guard !decimalString.trimmingCharacters(in: .whitespaces).isEmpty else {
      errorMsg = "Please add an hourly wage."
      return false
    }

    // check that decimal string is a valid double
    guard Double(decimalString)?.isNaN == false else {
      // TODO: fix error message to something helpful
      errorMsg = "Fucked up double"
      return false
    }
    
    return true
  }
}
