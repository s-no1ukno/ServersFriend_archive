//
//  ShiftRowView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/15/24.
//

import SwiftUI

struct ShiftRowView: View {
//  @EnvironmentObject var vm: ShiftsViewVM
  @ObservedObject var model: ShiftsViewVM
  
  @State var isShowingEdit = false
  
  @State var id: String
  @State var nameOfShift: String
  @State var hourlyWage: Double
  @State var tipIn: Bool
  @State var tipOut: Bool
  @State var shift: Shift

  init(targetShift: Shift) {
//    self._showingEditPopup = showingEditPopup
    self.id = targetShift.id
    self.nameOfShift = targetShift.nameOfShift
    self.hourlyWage = targetShift.hourlyWage
    self.tipIn = targetShift.tipIn
    self.tipOut = targetShift.tipOut
    self.shift = targetShift
    self._model = ObservedObject(wrappedValue: ShiftsViewVM(targetShift: nil))
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
        model.deleteShift(id: id)
      }
      .tint(.red)
    }
    .swipeActions(edge: .leading) {
      Button("Edit") {
        print("edit item here")
        // TODO: Hook up edit shift functionality here
        model.isShowingEditShift = true
      }
      .tint(.green)
    }
//    .sheet(isPresented: $isShowingEdit) {
//      EditShiftTypeView(targetShift: shift)
//    }
    .popup(isPresented: $model.isShowingEditShift) {
      EditShiftTypeView(targetShift: shift)
        .frame(
          width: UIScreen.main.bounds.width - 20,
//          height: (UIScreen.main.bounds.height / 3) * 2 - 10
          height: (UIScreen.main.bounds.height / 3) - 10
        )
        .background(Color(red: 0.9, green: 0.9, blue: 0.9))
        .cornerRadius(30)
    } customize: {
      $0
        .type(.floater())
        .closeOnTap(false)
        .dragToDismiss(true)
        .isOpaque(true)
        .closeOnTapOutside(true)
        .backgroundColor(.black.opacity(0.4))
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
  )
}
