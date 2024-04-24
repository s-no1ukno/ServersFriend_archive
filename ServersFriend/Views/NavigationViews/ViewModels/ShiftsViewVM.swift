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
  
  @Published var showAlert = false
  @Published var alertTitle = ""
  @Published var alertMessage = ""
  
  @Published var isShowingNewShift = false
  @Published var isShowingEditShift = false
  @Published var errorMsg = ""
  
  @Published var shiftID = ""
  @Published var shiftTypeName = ""
  @Published var decimalString = ""
  @Published var hourlyWage = 0.00
  @Published var tipIn = false
  @Published var tipOut = false
  
  init(targetShift: Shift?) {
    if (targetShift != nil) {
      self.shiftID = targetShift?.id ?? ""
      self.shiftTypeName = targetShift?.nameOfShift ?? ""
      self.decimalString = String(format: "%.2f", targetShift!.hourlyWage)
      self.hourlyWage = targetShift?.hourlyWage ?? 0.00
      self.tipIn = targetShift?.tipIn ?? false
      self.tipOut = targetShift?.tipOut ?? false
    }
  }
  
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
  
  func updateShift(id: String) -> Void {
    print("updating shift with id: \(id)")
    
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
    
    // Update Model
    let newShift = Shift(
      id: shiftID,
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
      .document(shiftID)
      .setData(newShift.asDictionary())
    
    // if errorMsg isn't empty, empty it
    if !errorMsg.isEmpty {
      errorMsg = ""
    }
    
    // reset state
    resetState()
    
    // return `isShowingNewShift` to false to toggle the sheet back off
    isShowingEditShift = false

  }
  
  func deleteShift (id: String) -> Void {
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
