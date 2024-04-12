//
//  Outlets.swift
//  ServersFriend
//
//  Created by Jordan Snow on 3/28/24.
//

import Foundation
import UIKit

class Outlets: UIViewController {
  @IBOutlet weak var checkBoxOutlet:UIButton!{
    didSet{
      checkBoxOutlet.setImage(UIImage(named:"unchecked"), for: .normal)
      checkBoxOutlet.setImage(UIImage(named:"checked"), for: .selected)
    }
  }
  
  @IBAction func checkbox(_ sender: UIButton){
    sender.checkboxAnimation {
      print("I'm done")
      //here you can also track the Checked, UnChecked state with sender.isSelected
      print(sender.isSelected)
      
    }
  }
}
