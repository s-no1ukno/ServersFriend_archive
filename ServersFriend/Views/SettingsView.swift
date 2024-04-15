//
//  SettingsView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/11/24.
//

import SwiftUI
import FirebaseFirestoreSwift
import PopupView

struct SettingsView: View {
  @StateObject var viewModel: SettingsViewVM
  @FirestoreQuery var items: [Shift]
  
  @State var showingEditPopup: Bool
  
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
    self._showingEditPopup = State(initialValue: false)
  }
  
//  var targetShift: Shift
  
  var body: some View {
    
    VStack {
      if items.isEmpty {
        Text("Add a new shift to start adding tips!")
      } else {
        List {
          Section {
            ForEach(items) { item in
              // TODO: Refactor component here for each row -> then `item` binding can be handed to popup
              
              ShiftRowView(targetShift: item, showingEditPopup: $showingEditPopup)
            }
          } header: {
            Text("Current Shift Types")
              .foregroundColor(.blue)
              .bold()
          }
        }
        .listStyle(InsetGroupedListStyle())
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
    .popup(isPresented: $showingEditPopup) {
      Text("The popup")
        .frame(width: 200, height: 60)
        .background(Color(red: 0.85, green: 0.8, blue: 0.95))
        .cornerRadius(30.0)
    } customize: {
      $0.autohideIn(2)
    }
  }
}

#Preview {
    SettingsView(userID: "io741v5yxYPiRveSiqfnGdjKch82")
}
