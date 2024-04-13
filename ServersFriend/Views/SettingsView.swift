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
  
  private func formatTipText(bool: Bool) -> Text {
    if bool == false {
      return Text("No").foregroundColor(.red)
    } else {
      return Text("Yes").foregroundColor(.green)
    }
  }
  
  var body: some View {
    
    VStack {
      if items.isEmpty {
        Text("Add a new shift to start adding tips!")
      } else {
        List {
          Section {
            ForEach(items) { item in
              VStack {
                HStack {
                  Text(item.nameOfShift)
                    .bold()
                  Spacer()
                  Text(String(format: "$ %.2f per hour", item.hourlyWage))
                    .bold()
                }
                .padding(.top, 10)
                .padding(.bottom, 10)
                HStack {
                  VStack(alignment: .leading) {
                    Text("Tracking Tip In? \(formatTipText(bool: item.tipIn))")
                    Text("Tracking Tip Out? \(formatTipText(bool: item.tipOut))")
                  }
                  .font(.caption)
                  .bold()
                  
                  Spacer()
                }
              }
              .swipeActions {
                Button("Delete") {
                  print("delete item here")
                }
                .tint(.red)
              }
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
    
  }
}

#Preview {
    SettingsView(userID: "io741v5yxYPiRveSiqfnGdjKch82")
}
