//
//  Color-theme.swift
//  DailyMessage
//
//  Created by Alpay Calalli on 05.06.23.
//

import Foundation
import SwiftUI

extension ShapeStyle where Self == Color {
    static var darkBackground: Color {
        Color(UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00))
    }
    
    static var lightBackground: Color{
        Color(UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00))
    }
}
