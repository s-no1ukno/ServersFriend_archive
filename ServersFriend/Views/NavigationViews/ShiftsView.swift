//
//  ShiftsView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/21/24.
//

import SwiftUI
import FirebaseFirestore

struct ShiftsView: View {
  
  @StateObject var vm = ShiftsViewVM()
  @State var currentUserID: String
  @FirestoreQuery var shifts: [Shift]

  init(userID: String) {
    self.currentUserID = userID
    self._shifts = FirestoreQuery(
      collectionPath: "users/\(userID)/shifts"
    )
  }

  var body: some View {
    NavigationStack {
      ZStack {
        if !shifts.isEmpty {
          // shifts found in table, display a shift row for each shift
          List {
            Section {
              ForEach(shifts) { shift in
                ShiftRowView(targetShift: shift /*showingEditPopup: $showingEditPopup*/)
              }
            } header: {
              Text("Current Shift Types")
                .foregroundColor(.blue)
                .bold()
            }
          }
          .listStyle(InsetGroupedListStyle())
        } else {
          // No shifts in table yet, add a new shift
          VStack {
            Text("No Shift Data Currently")
              .font(.title2)
            
            Text("Once you add tips to shifts, tracking data will appear here...")
              .padding(.top, 30)

          }
        }

      }
      .navigationTitle("Shifts")
      .toolbar{
        ToolbarItem(placement: .bottomBar) {
          HStack {
            Spacer()
            Button {
              print("pressed add button")
              vm.isShowingNewShift = true
            } label: {
              Image(systemName: "plus.circle.fill")
                .font(.largeTitle)
            }
          }
        }
      }
      .sheet(isPresented: $vm.isShowingNewShift) {
        NewShiftTypeView(viewModel: ShiftsViewVM())
      }
//      .popup(isPresented: $vm.isShowingNewShift) {
//        NewShiftTypeView(viewModel: vm)
//          .frame(
//            width: UIScreen.main.bounds.width - 20,
//            height: (UIScreen.main.bounds.height / 3) * 2 - 10
//          )
//          .background(Color(red: 0.9, green: 0.9, blue: 0.9))
//          .cornerRadius(30)
//      } customize: {
//        $0
//          .closeOnTap(false)
//          .dragToDismiss(true)
//          .isOpaque(true)
//      }
    }
  }
}

#Preview {
  ShiftsView(userID:"io741v5yxYPiRveSiqfnGdjKch82")
}
