//
//  ServerOverviewView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 3/26/24.
//

import SwiftUI

struct ServerOverviewView: View {
  
  var body: some View {
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
        print("clicked the button")
      }
      .buttonStyle(BorderedButtonStyle())
      .padding(.bottom, 50)
    }
    
  }
}

#Preview {
  ServerOverviewView()
}
