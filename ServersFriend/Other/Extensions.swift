//
//  Extensions.swift
//  ServersFriend
//
//  Created by Jordan Snow on 3/27/24.
//

import Foundation
import UIKit

extension Encodable {
  func asDictionary() -> [String: Any] {
    guard let data = try? JSONEncoder().encode(self) else {
      return [:]
    }
    
    do {
      let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
      return json ?? [:]
    } catch {
      return [:]
    }
  }
}

extension UIButton {
  func checkboxAnimation(closure: @escaping () -> Void){
    guard let image = self.imageView else {return}
    
    UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
      image.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
    }) { (success) in
      UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
        self.isSelected = !self.isSelected
        //to-do
        closure()
        image.transform = .identity
      }, completion: nil)
    }
  }
}
