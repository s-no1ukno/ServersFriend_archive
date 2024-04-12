//
//  Shift.swift
//  ServersFriend
//
//  Created by Jordan Snow on 3/27/24.
//

import Foundation
import FirebaseFirestore

struct Shift: Codable, Identifiable {
  let id: String
  let typeOfShift: String
  let hourlyWage: Double

  // TODO: IMPLEMENT LATER
  //  let tipIn: Bool
  //  let tipOut: Bool
  //  let timeIn: Date?
  //  let timeOut: Date?
  //  let employer: DocumentReference?
}
