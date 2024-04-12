//
//  SettingsViewVM.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/11/24.
//

import Foundation

class SettingsViewVM: ObservableObject {
  @Published var showingNewShiftTypeView: Bool = false
  
  private let userID: String
  
  init(userID: String) {
    self.userID = userID
  }
}
