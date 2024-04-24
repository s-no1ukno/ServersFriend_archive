//
//  EditShiftTypeVM.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/23/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class EditShiftTypeVM: ObservableObject {
  
  @Published var id: String
  @Published var nameOfShift: String
  @Published var hourlyWage: Double
  @Published var decimalString: String
  @Published var tipIn: Bool
  @Published var tipOut: Bool
  
  @Published var errorMsg = ""
  
  init(targetShift: Shift) {
//    self.shift = targetShift
    self.id = targetShift.id
    self.nameOfShift = targetShift.nameOfShift
    self.decimalString = String(targetShift.hourlyWage)
    self.hourlyWage = targetShift.hourlyWage
    self.tipIn = targetShift.tipIn
    self.tipOut = targetShift.tipOut
  }
  
  func updateShift() -> Void {
    print("saving new record")
    
    guard let currentUserID = Auth.auth().currentUser?.uid else {
      return
    }
    guard canSave else {
      return
    }
    hourlyWage = Double(decimalString) ?? 0.00
    
    // update call model
    let db = Firestore.firestore()
    
    let newShift = Shift(
      id: id,
      nameOfShift: nameOfShift,
      hourlyWage: hourlyWage,
      tipIn: tipIn,
      tipOut: tipOut
    )
    
    // TODO: error handling needs to be set up here
    db.collection("users")
      .document(currentUserID)
      .collection("shifts")
      .document(id)
      .updateData(newShift.asDictionary())
  }
  
  private var canSave: Bool {
    // validation for saving here
    // check that nameOfShift is not empty
    guard !nameOfShift.trimmingCharacters(in: .whitespaces).isEmpty else {
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
