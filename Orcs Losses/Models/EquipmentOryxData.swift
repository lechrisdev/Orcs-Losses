//
//  EquipmentOryx.swift
//  Orcs Losses
//
//  Created by Le Chris on 27.08.2023.
//

import Foundation

// MARK: - EquipmentOryxDatum
struct EquipmentOryxDatum: Codable {
    let equipmentOryx, model: String
    let manufacturer: String
    let lossesTotal: Int
    let equipmentUa: String

    enum CodingKeys: String, CodingKey {
        case equipmentOryx = "equipment_oryx"
        case model, manufacturer
        case lossesTotal = "losses_total"
        case equipmentUa = "equipment_ua"
    }
}

//enum EquipmentUa: String, Codable {
//    case aircrafts = "Aircrafts"
//    case antiAircraftWarfareSystems = "Anti-aircraft Warfare Systems"
//    case armouredPersonnelCarriers = "Armoured Personnel Carriers"
//    case artillerySystems = "Artillery Systems"
//    case helicopters = "Helicopters"
//    case multipleRocketLaunchers = "Multiple Rocket Launchers"
//    case specialEquipment = "Special Equipment"
//    case tanks = "Tanks"
//    case unmannedAerialVehicles = "Unmanned Aerial Vehicles"
//    case vehicleAndFuelTank = "Vehicle and Fuel Tank"
//    case warshipsBoats = "Warships, Boats"
//}
//
//enum Manufacturer: String, Codable {
//    case iran = "Iran"
//    case israel = "Israel"
//    case italy = "Italy"
//    case poland = "Poland"
//    case russia = "Russia"
//    case theCzechRepublic = "the Czech Republic"
//    case theSovietUnion = "the Soviet Union"
//}

typealias EquipmentOryxData = [EquipmentOryxDatum]
