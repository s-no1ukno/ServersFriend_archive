//
//  ShiftTypesList.swift
//  ServersFriend
//
//  Created by Jordan Snow on 3/28/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ShiftTypesList: View {
  @FirestoreQuery var shifts: [Shift]
  
  init(userID: String) {
    // Query to database for entries along following path:
    // users/<id>/shifts/<entries>
    self._shifts = FirestoreQuery(collectionPath: "users/\(userID)/shifts")
  }
  
  var body: some View {
    VStack {
      Text("Hello from Shift Types List")
      //      List(shifts) { shift in
      //        Text(shift.id)
      //      }
    }
  }
}

#Preview {
  ShiftTypesList(userID: "io741v5yxYPiRveSiqfnGdjKch82")
}
