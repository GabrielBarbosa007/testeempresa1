//
//  UserModel.swift
//  DesafioLogs
//
//  Created by Gabriel Barbosa on 25/04/2022.
//

import Foundation

class UserModel: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    init(title: String, body: String, userId: Int, id: Int ){
        self.title = title
        self.body = body
        self.userId = userId
        self.id = id
    
    }
}
