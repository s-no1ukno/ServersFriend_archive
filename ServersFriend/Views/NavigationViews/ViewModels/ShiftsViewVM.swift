//
//  ShiftsViewVM.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/21/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ShiftsViewVM: ObservableObject {
  
  let db = Firestore.firestore()
  
  @Published var showAlert = false
  @Published var alertTitle = ""
  @Published var alertMessage = ""
  
  @Published var isShowingNewShift = false
  @Published var errorMsg = ""
  
  var shiftTypeName = ""
  var decimalString = ""
  var hourlyWage = 0.00
  var tipIn = false
  var tipOut = false
  
  func createNewShiftType() {
    // get current userID
    guard let currentUserID = Auth.auth().currentUser?.uid else {
      // if current user can't be found, pop an alert and stop
      triggerAlert(
        title: "No Current User",
        msg: "Something's very wrong, contact support please."
      )
      return
    }
    guard canSave() else {
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
    
    // if errorMsg isn't empty, empty it
    if !errorMsg.isEmpty {
      errorMsg = ""
    }
    
    // reset state
    resetState()
    
    // return `isShowingNewShift` to false to toggle the sheet back off
    isShowingNewShift = false
  }
  
  private func canSave() -> Bool {
    print("Calling canSave func")
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
      errorMsg = "Fucked up double"
      return false
    }
    
    return true
  }
  
  /// Triggers a pop up alert with the title and message that is passed in
  /// - Parameters:
  ///   - title: Title of the alert popup
  ///   - msg: Message to be displayed in alert popup
  private func triggerAlert(title: String, msg: String) {
    alertTitle = title
    alertMessage = msg
    showAlert = true
  }
  
  /// Resets the view model's state to imitate a new initialization
  private func resetState() {
    showAlert = false
    alertTitle = ""
    alertMessage = ""
    
    isShowingNewShift = false
    errorMsg = ""
    
    shiftTypeName = ""
    decimalString = ""
    hourlyWage = 0.00
    tipIn = false
    tipOut = false
  }
}
