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
    Text("New Shift Type View")
    
    
    // SHIFT TYPE STRUCT
    //    let id: String
    //    let hourlyWage: Double
    //    let typeOfShift: String
    //    let employer: DocumentReference
    
    // TODO: IMPLEMENT LATER
    //    let tipIn: Bool
    //    let tipOut: Bool
    //    let timeIn: TimeInterval
    //    let timeOut: TimeInterval
    
    Form {
      // error message if validation doesn't pass
      if !viewModel.errorMsg.isEmpty {
        Text(viewModel.errorMsg)
          .foregroundColor(.red)
      }
      
      // Employer Dropdown
      
      // Shift Type Name *
      TextField("Shift Type Name", text: $viewModel.shiftType)
      TextField("Hourly Wage", text: $viewModel.decimalString)
        .keyboardType(.decimalPad)

//      TextField("Hourly Wage", value: $viewModel.hourlyWage, format: .number)
      
      //      HStack {
      //        // Hourly Wage (only if user has 'trackHourly == true'
      //        Text("Hourly Wage: //TODO")
      //        Spacer()
      //
      //        VStack(alignment: .trailing) {
      //          // Usually requires Tip In? (checkbox)
      //          Toggle("Track Tip In? ", isOn: $viewModel.tipIn)
      //
      //          // Usually requires Tip Out? (checkbox)
      //          Toggle("Track Tip Out? ", isOn: $viewModel.tipOut)
      //
      //        }
      //        .toggleStyle(iOSCheckboxToggleStyle())
      //      }
      //      .padding(.top, 10)
      //      .padding(.bottom, 10)
      
      //      VStack {
      //        // Typical Time in ?
      //        DatePicker(
      //          "Time In",
      //          selection: $viewModel.timeIn,
      //          displayedComponents: .hourAndMinute
      //        )
      ////        .disabled(true)
      ////        .foregroundColor(.gray)
      //
      //        // Typical Time Out ?
      //        DatePicker(
      //          "Time Out",
      //          selection: $viewModel.timeOut,
      //          displayedComponents: .hourAndMinute
      //        )
      ////        .disabled(true)
      ////        .foregroundColor(.gray)
      //      }
      
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

struct iOSCheckboxToggleStyle: ToggleStyle {
  func makeBody(configuration: Configuration) -> some View {
    Button(action: {
      configuration.isOn.toggle()
    }, label: {
      HStack {
        configuration.label.font(.system(size: 14))
        Button {
          configuration.isOn.toggle()
        } label: {
          Image(systemName: configuration.isOn ? "checkmark.square" : "square")
        }
      }
    })
  }
}

#Preview {
  NewShiftTypeView(newShiftTypePresented: Binding(get: {
    return true
  }, set: { _ in
    
  }))
}
