//
//  LossesPersonnelData.swift
//  Orcs Losses
//
//  Created by Le Chris on 27.08.2023.
//

import Foundation

// MARK: - LossesPersonnelDatum
struct LossesPersonnelDatum: Codable {
    let date: String
    let day, personnel: Int
    let lossesPersonnelDatumPersonnel: Personnel
    let pow: Int?

    enum CodingKeys: String, CodingKey {
        case date, day, personnel
        case lossesPersonnelDatumPersonnel = "personnel*"
        case pow = "POW"
    }
}

enum Personnel: String, Codable {
    case about = "about"
    case more = "more"
}

typealias LossesPersonnelData = [LossesPersonnelDatum]
