//
//  Message.swift
//  DailyMessage
//
//  Created by Alpay Calalli on 05.06.23.
//

import Foundation

struct Message: Codable, Hashable {
    var name: String
    var category: String
    var elements: [String]
}
