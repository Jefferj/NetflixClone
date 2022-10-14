//
//  Extensions.swift
//  NetflixClone
//
//  Created by Jefferson Naranjo rodríguez on 14/10/22.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
