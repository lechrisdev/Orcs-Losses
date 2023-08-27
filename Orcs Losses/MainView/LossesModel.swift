//
//  Model.swift
//  Orcs Losses
//
//  Created by Le Chris on 27.08.2023.
//

import Foundation

struct LossesModel {
    
    var date: String
    var day: Int
    var personnel: Int
    var aircraft: Int
    var helicopter: Int
    var tank: Int
    var apc: Int
    var fieldArtillery: Int
    var mrl: Int
    var drone: Int
    var navalShip: Int
    var antiAircraftWarfare: Int
    var specialEquipment: Int
    var vehiclesAndFuelTanks: Int
    var cruiseMissiles: Int
    
}

enum LossesType {
    case personnel
    case aircraft
    case helicopter
    case tank
    case apc
    case fieldArtillery
    case mrl
    case drone
    case navalShip
    case antiAircraftWarfare
    case specialEquipment
    case vehiclesAndFuelTanks
    case cruiseMissiles
    
    func title() -> String {
        switch self {
        case .personnel:
            return ""
        case .aircraft:
            return "Літаки"
        case .helicopter:
            return "Гелікоптери"
        case .tank:
            return "Танки"
        case .apc:
            return "БТР"
        case .fieldArtillery:
            return "Польова артилерія"
        case .mrl:
            return "Артилерійські системи"
        case .drone:
            return "Дрони"
        case .navalShip:
            return "Морські кораблі"
        case .antiAircraftWarfare:
            return "ППО"
        case .specialEquipment:
            return "Спецтехніка"
        case .vehiclesAndFuelTanks:
            return "Транспортні засоби та паливні баки"
        case .cruiseMissiles:
            return "Крилаті ракети"
        }
    }
    
    func equipmentOryx() -> String {
        switch self {
        case .personnel:
            return ""
        case .aircraft:
            return "Aircrafts"
        case .helicopter:
            return "Helicopters"
        case .tank:
            return "Tanks"
        case .apc:
            return "Armoured Personnel Carriers"
        case .fieldArtillery:
            return "Multiple Rocket Launchers"
        case .mrl:
            return "Artillery Systems"
        case .drone:
            return ""
        case .navalShip:
            return "Warships, Boats"
        case .antiAircraftWarfare:
            return "Anti-aircraft Warfare Systems"
        case .specialEquipment:
            return "Special Equipment"
        case .vehiclesAndFuelTanks:
            return "Vehicle and Fuel Tank"
        case .cruiseMissiles:
            return ""
        }
    }
}
