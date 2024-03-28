//
//  Shift.swift
//  ServersFriend
//
//  Created by Jordan Snow on 3/27/24.
//

import Foundation
import FirebaseFirestore

struct Shift: Codable {
  let id: String
  let hourlyWage: Double
  let typeOfShift: String
  let tipIn: Bool
  let tipOut: Bool
  let timeIn: TimeInterval
  let timeOut: TimeInterval
  let employer: DocumentReference
}
