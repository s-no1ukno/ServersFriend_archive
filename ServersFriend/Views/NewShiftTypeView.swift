//
//  NewShiftTypeView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 3/28/24.
//

import SwiftUI

let formatter: NumberFormatter = {
  let formatter = NumberFormatter()
  formatter.numberStyle = .decimal
  return formatter
}()

struct NewShiftTypeView: View {
  @StateObject var viewModel = NewShiftTypeViewVM()
  @Binding var newShiftTypePresented: Bool
  
  var body: some View {
    
    ZStack {
      RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
        .foregroundColor(.blue)
      
      VStack {
        Text("New Shift Type")
          .foregroundColor(.white)
          .font(.system(size: 30))
          .bold()
          .padding(.top, 30)

        Form {
          // error message if validation doesn't pass
          if !viewModel.errorMsg.isEmpty {
            Text(viewModel.errorMsg)
              .foregroundColor(.red)
          }
          
          HStack {
            Text("Shift Name | ")
            TextField("", text: $viewModel.shiftTypeName)
          }
          HStack {
            Text("Hourly Wage | $")
            TextField("", text: $viewModel.decimalString)
              .keyboardType(.decimalPad)
          }
          HStack {
            //  track tip in/tip out checkboxes
            Toggle("Track Tip In? ", isOn: $viewModel.tipIn)
            Spacer()
            Toggle("Track Tip Out? ", isOn: $viewModel.tipOut)
          }
          .toggleStyle(iOSCheckboxToggleStyle())
          
          HStack {
            Spacer()
            Button("Save") {
              viewModel.createNewShiftType()
              guard viewModel.errorMsg.isEmpty else {
                return
              }
              newShiftTypePresented = false
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

#Preview {
  NewShiftTypeView(newShiftTypePresented: Binding(get: {
    return true
  }, set: { _ in
    
  }))
}
