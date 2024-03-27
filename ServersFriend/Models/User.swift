//
//  User.swift
//  ServersFriend
//
//  Created by Jordan Snow on 3/26/24.
//

import Foundation

struct User: Codable {
  let id: String
  let name: String
  let email: String
  let joined: TimeInterval
}
