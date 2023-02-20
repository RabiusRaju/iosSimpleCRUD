//
//  Models.swift
//  SimpleCrud
//
//  Created by Md. Rabius Sani Raju on 20/2/23.
//

import Foundation
import SwiftUI

struct DataModel : Decodable {
    let error : String
    let message : String
    let data : [PostModel]
}

struct PostModel : Decodable {
    let id : Int
    let title : String
    let post : String
}
