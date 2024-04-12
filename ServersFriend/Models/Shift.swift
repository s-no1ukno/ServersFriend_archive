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
  let nameOfShift: String
  let hourlyWage: Double
  let tipIn: Bool
  let tipOut: Bool
//  let employer: DocumentReference?
}
