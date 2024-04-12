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
      Text("Your shift types:")
      // list of shifts
      List(items) { item in
        HStack {
          Text(item.typeOfShift)
          Spacer()
          Text(String(item.hourlyWage))
        }
        .swipeActions {
          Button("Delete") {
            print("delete item here")
          }
          .tint(.red)
        }
      }
      .listStyle(PlainListStyle())
      
      
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
