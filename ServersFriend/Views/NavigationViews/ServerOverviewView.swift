//
//  ServerOverviewView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 3/26/24.
//

import SwiftUI

struct ServerOverviewView: View {
  
  @StateObject var controller = ServerOverviewVM()
  
  
  
  var body: some View {
    NavigationStack {
      VStack {
        HStack {
          VStack {
            Text("You have made")
            Text("$2520.00")
              .font(.system(size: 20))
              .bold()
            Text("this month")
          }
          .padding(.horizontal, 30)
          Spacer()
          VStack {
            Text("You have made")
            Text("$142.00")
              .font(.system(size: 20))
              .bold()
            Text("this week")
          }
          .padding(.horizontal, 30)
        }
        .padding(.top, 100)
        Spacer()
        Button("Add Tip") {
          controller.isShowingNewTip = true
        }
        .buttonStyle(BorderedButtonStyle())
        .padding(.bottom, 50)
      }
      .navigationTitle("Server Overview")
      .popup(isPresented: $controller.isShowingNewTip) {
        NewTipView(controller: controller)
        .frame(
          width: UIScreen.main.bounds.width - 30,
          height: UIScreen.main.bounds.height / 3
        )
        .cornerRadius(20)
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
}

#Preview {
  ServerOverviewView()
}
