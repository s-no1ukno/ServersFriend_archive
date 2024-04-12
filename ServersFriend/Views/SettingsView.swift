//
//  SettingsView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/11/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct SettingsView: View {
  @StateObject var viewModel: SettingsViewVM
  @FirestoreQuery var items: [Shift]
  
  init(userID: String) {
    // Query to database for entries along following path:
    // users/<id>/shifts/<entries>
    self._items = FirestoreQuery(
      collectionPath: "users/\(userID)/shifts"
    )
    
    // instantiate the viewModel in the constructor to have access
    // to userId in view model (for deletion)
    self._viewModel = StateObject(
      wrappedValue: SettingsViewVM(userID: userID)
    )

  }
  
  var body: some View {
    
    VStack {
      if items.isEmpty {
        Text("Add a new shift to start adding tips!")
      } else {
        Text("Your shift types:")
        // list of shifts
        List(items) { item in
          HStack {
            Text(item.nameOfShift)
              .bold()
            Spacer()
            Text(String(format: "$ %.2f", item.hourlyWage))
            
            VStack {
              Text("Tracking Tip In? : \(item.tipIn)")
              Text("Tracking Tip Out? : \(item.tipOut)")
            }
            .font(.caption)
          }
          .swipeActions {
            Button("Delete") {
              print("delete item here")
            }
            .tint(.red)
          }
        }
        .listStyle(PlainListStyle())

      }
      
      
      // add shift button
      Button("New Shift Type") {
        viewModel.showingNewShiftTypeView = true
      }
      .padding(.top, 50)
      .padding(.bottom, 50)

    }
    .sheet(isPresented: $viewModel.showingNewShiftTypeView) {
      NewShiftTypeView(newShiftTypePresented: $viewModel.showingNewShiftTypeView)
    }
    
  }
}

#Preview {
    SettingsView(userID: "io741v5yxYPiRveSiqfnGdjKch82")
}
