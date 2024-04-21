//
//  CalendarView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/21/24.
//

import SwiftUI

struct CalendarView: View {
  var body: some View {
    NavigationStack {
      VStack {
        Text("Calendar View")
          .font(.title)
      }
      .navigationTitle("Calendar")
    }
  }
}

#Preview {
  CalendarView()
}
