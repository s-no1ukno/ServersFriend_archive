//
//  NewTipView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/24/24.
//

import SwiftUI

struct NewTipView: View {
  @ObservedObject var controller: ServerOverviewVM
  
  var body: some View {
      VStack {
        Form {
          HStack {
            Text("$")
            TextField("Tip Amount", text: $controller.decimalString)
          }
          if controller.shifts != nil && !controller.shifts!.isEmpty {
            Picker("Shift", selection: $controller.pickerSelection) {
              ForEach(controller.shifts!) { shift in
                Text(shift.nameOfShift)
              }
            }
          }
          HStack {
            Spacer()
            Button("Save") {
              let chosen = controller.shifts?.filter({ shift in
                if shift.id == controller.pickerSelection {
                  return true
                }
                return false
              })
              // TODO: fix the bug for initial value for pickerSelection
              print("Saving data", controller.decimalString, chosen?[0] ?? controller.shifts?[0])
            }
            .buttonStyle(BorderedProminentButtonStyle())

          }
        }
      }
      .background(Color.white.cornerRadius(20))
      .onAppear(perform: controller.getAllShifts)
    }
}

#Preview {
    NewTipView(controller: ServerOverviewVM())
}
