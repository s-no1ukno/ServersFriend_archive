//
//  EditShiftTypeView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/23/24.
//

import SwiftUI

struct EditShiftTypeView: View {
  
  @State var shift: Shift
  @ObservedObject var vm: ShiftsViewVM
  
  init(targetShift: Shift) {
    self.shift = targetShift
    self._vm = ObservedObject(wrappedValue: ShiftsViewVM(targetShift: targetShift))
  }
  
  var body: some View {
    ZStack {
      VStack {
        Form {
          Section(header: Text("Edit Shift")) {
            // error message if validation doesn't pass
//            if !viewModel.errorMsg.isEmpty {
//              Text(viewModel.errorMsg)
//                .foregroundColor(.red)
//            }
            
            HStack {
              TextField("Shift Name", text: $vm.shiftTypeName)
            }
            HStack {
              Text("Hourly Wage: $")
              TextField("", text: $vm.decimalString)
                .keyboardType(.decimalPad)
            }
            HStack {
              //  track tip in/tip out checkboxes
              Toggle("Track Tip In? ", isOn: $vm.tipIn)
              Spacer()
              Toggle("Track Tip Out? ", isOn: $vm.tipOut)
            }
            .toggleStyle(iOSCheckboxToggleStyle())
            
            HStack {
              Spacer()
              Button("Save") {
                vm.updateShift(id: shift.id)
              }
              .buttonStyle(BorderedProminentButtonStyle())
            }
            .padding(.top, 10)
            .padding(.bottom, 10)
          }
          
        }
      }
    }
    
  }
}

#Preview {
  EditShiftTypeView(targetShift: Shift (
    id: "boobs69420",
    nameOfShift: "Bartender",
    hourlyWage: 12.50,
    tipIn: false,
    tipOut: false
  ))
}
