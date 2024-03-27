//
//  HeaderView.swift
//  ServersFriend
//
//  Created by Jordan Snow on 3/26/24.
//

import SwiftUI

struct Header: View {
  let title: String
  let subtitle: String
  let angle: Double
  let color: Color
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
        .foregroundColor(color)
        .rotationEffect(Angle(degrees: angle))
      
      VStack {
        // do we want this left-aligned?
        Text(title)
          .foregroundColor(.white)
          .font(.system(size: 50))
          .bold()
        
        Text(subtitle)
          .foregroundColor(.white)
          .font(.system(size: 20))
      }
      .padding(.top, 80)
    }
    .frame(width: UIScreen.main.bounds.width * 3, height: 350)
    .offset(y: -150)
  }
}

#Preview {
  Header(title: "Login", subtitle: "Login to begin...", angle: 15, color: .blue)
}
