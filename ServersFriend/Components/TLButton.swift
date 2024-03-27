//
//  TLButton.swift
//  ServersFriend
//
//  Created by Jordan Snow on 3/26/24.
//

import SwiftUI

struct TLButton: View {
  let title: String
  let color: Color
  let action: () -> Void
  
  var body: some View {
    Button {
      // reference to action passthrough
      action()
    } label: {
      ZStack {
        RoundedRectangle(cornerRadius: 10)
          .foregroundColor(color)
        
        Text(title)
          .foregroundColor(.white)
          .bold()
      }
    }
    .padding()
  }
}

#Preview {
  TLButton(title: "Button Text", color: .blue) {
    // action
  }
}
