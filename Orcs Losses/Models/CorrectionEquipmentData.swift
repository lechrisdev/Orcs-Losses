//
//  CorrectionEquipment.swift
//  Orcs Losses
//
//  Created by Le Chris on 27.08.2023.
//

import Foundation

// MARK: - CorrectionEquipmentDatum
struct CorrectionEquipmentDatum: Codable {
    let date: String
    let day, aircraft, helicopter, tank: Int
    let apc, fieldArtillery, mrl, drone: Int
    let navalShip, antiAircraftWarfare, specialEquipment, vehiclesAndFuelTanks: Int
    let cruiseMissiles: Int

    enum CodingKeys: String, CodingKey {
        case date, day, aircraft, helicopter, tank
        case apc = "APC"
        case fieldArtillery = "field artillery"
        case mrl = "MRL"
        case drone
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case cruiseMissiles = "cruise missiles"
    }
}

typealias CorrectionEquipmentData = [CorrectionEquipmentDatum]
