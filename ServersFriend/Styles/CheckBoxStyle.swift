//
//  File.swift
//  ServersFriend
//
//  Created by Jordan Snow on 4/12/24.
//

import SwiftUI

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
