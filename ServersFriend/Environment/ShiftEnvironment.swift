//
//  ShiftEnvironment.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/18/24.
//

import Foundation

public class ShiftEnvironment: ObservableObject {
  @Published var shift: Shift = Shift(
    id: "",
    nameOfShift: "",
    hourlyWage: 00,
    tipIn: false,
    tipOut: false
  )
  @Published var editing = false
  @Published var isDefault = true
}
