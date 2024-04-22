//
//  ShiftRowView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/15/24.
//

import SwiftUI

struct ShiftRowView: View {
//  @Binding var showingEditPopup: Binding<Bool>
  @EnvironmentObject var shiftEditSettings: ShiftEnvironment
  @StateObject var viewModel = ShiftRowViewVM()
//  @Binding var showingEditPopup: Bool
  
  @State var id: String
  @State var nameOfShift: String
  @State var hourlyWage: Double
  @State var tipIn: Bool
  @State var tipOut: Bool
  
  init(targetShift: Shift) {
//    self._showingEditPopup = showingEditPopup
    self.id = targetShift.id
    self.nameOfShift = targetShift.nameOfShift
    self.hourlyWage = targetShift.hourlyWage
    self.tipIn = targetShift.tipIn
    self.tipOut = targetShift.tipOut
  }
  
  /// Updates `ShiftEnvironment` variable to store the target shift being updated in a different part of app
  private func handleEditShift() {
//    showingEditPopup = true
    print("editing")
    //    shiftEditSettings.editing = true
//    shiftEditSettings.isDefault = false
//    shiftEditSettings.shift = Shift(
//      id: id,
//      nameOfShift: nameOfShift,
//      hourlyWage: hourlyWage,
//      tipIn: tipIn,
//      tipOut: tipOut
//    )
  }

  private func formatTipText(bool: Bool) -> Text {
    if bool == false {
      return Text("No").foregroundColor(.red)
    } else {
      return Text("Yes").foregroundColor(.green)
    }
  }
  
  // set the initial value to the unbound query data
  // write a new function to handle updating the data (if necessary)
  
  var body: some View {
    VStack {
      HStack {
        Text(nameOfShift)
          .bold()
        Spacer()
        Text(String(format: "$ %.2f per hour", hourlyWage))
          .bold()
      }
      .padding(.top, 10)
      .padding(.bottom, 10)
      HStack {
        VStack(alignment: .leading) {
          Text("Tracking Tip In? \(formatTipText(bool: tipIn))")
          Text("Tracking Tip Out? \(formatTipText(bool: tipOut))")
        }
        .font(.caption)
        .bold()
        
        Spacer()
      }
    }
    .swipeActions(edge: .trailing){
      Button("Delete") {
        viewModel.deleteShift(id: id)
      }
      .tint(.red)
    }
    .swipeActions(edge: .leading) {
      Button("Edit") {
        print("edit item here")
        // TODO: Hook up edit shift functionality here
        handleEditShift()
      }
      .tint(.green)
    }
  }
}

#Preview {
  ShiftRowView(
    targetShift: Shift(
      id: "ef1919191lkjsd",
      nameOfShift: "Bartender",
      hourlyWage: 10.45,
      tipIn: false,
      tipOut: true
    )
//    showingEditPopup: Binding(get: {
//      return true
//    }, set: { _ in
//      
//    })
  )
}
