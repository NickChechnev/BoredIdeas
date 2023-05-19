//
//  Activity.swift
//  BoredIdeas
//
//  Created by Никита Чечнев on 18.05.2023.
//

import Foundation

struct Activity: Codable {
    let activity: String
    let type: String
    let participants: Int
    let price: Double
    let accessibility: Double
}
