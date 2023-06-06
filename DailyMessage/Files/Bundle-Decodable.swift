//
//  Bundle-Decodable.swift
//  DailyMessage
//
//  Created by Alpay Calalli on 04.06.23.
//

import Foundation

extension Bundle{
    func decode<T: Decodable>(_ file: String) -> T{
        
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Error")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Error")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data)else{
            fatalError("Error")
        }
        
        return loaded
        
    }
}
