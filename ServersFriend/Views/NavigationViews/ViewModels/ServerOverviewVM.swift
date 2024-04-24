//
//  ServerOverviewVM.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/24/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ServerOverviewVM: ObservableObject {
  @Published var isShowingNewTip = false
  
  @Published var decimalString = ""
  @Published var tipAmount = 0.00
  @Published var shifts: [Shift]?
  @Published var pickerSelection = ""
  
  func getAllShifts() -> Void {
    guard let currentUserID = Auth.auth().currentUser?.uid else {
      return
    }
    
    let db = Firestore.firestore()
    db.collection("users").document(currentUserID)
      .collection("shifts").getDocuments { querySnapshot, err in
        guard let documents = querySnapshot?.documents else {
          print("Error retrieving documents: \(err!)")
          return
        }
        
        
        self.shifts = documents.map { (queryDocumentSnapshot) -> Shift in
          let data = queryDocumentSnapshot.data()
          let id = data["id"] as? String ?? ""
          let name = data["nameOfShift"] as? String ?? ""
          let wage = data["hourlyWage"] as? Double ?? 0.00
          let tipIn = data["tipIn"] as? Bool ?? false
          let tipOut = data["tipOut"] as? Bool ?? false
          return Shift(id: id, nameOfShift: name, hourlyWage: wage, tipIn: tipIn, tipOut: tipOut)
        }
      }
  }
}
