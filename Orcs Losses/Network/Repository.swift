//
//  Repository.swift
//  Orcs Losses
//
//  Created by Le Chris on 27.08.2023.
//

import Foundation

protocol RepositoryProtocol {
    
}

class Repository: RepositoryProtocol {
    
    let api = API()
    
    func loadLosses() async throws -> [LossesModel] {
        
        var result: [LossesModel] = []
        
        let lossesEquipment = try await api.fetchData(url: Requests.getLossesEquipment.path!, LossesEquipmentData.self)
        let correctionEquipment = try await api.fetchData(url: Requests.getCorrectionEquipment.path!, CorrectionEquipmentData.self)
        let lossesPersonnel = try await api.fetchData(url: Requests.getLossesPersonnel.path!, LossesPersonnelData.self)
        
        for losses in lossesEquipment {
            
            var personnel = lossesPersonnel.first(where: {$0.date == losses.date})?.personnel
            
            var lossesModel = LossesModel(date:                 losses.date,
                                          day:                  losses.day,
                                          personnel:            personnel ?? 0,
                                          aircraft:             losses.aircraft,
                                          helicopter:           losses.helicopter,
                                          tank:                 losses.tank,
                                          apc:                  losses.apc,
                                          fieldArtillery:       losses.fieldArtillery,
                                          mrl:                  losses.mrl,
                                          drone:                losses.drone,
                                          navalShip:            losses.navalShip,
                                          antiAircraftWarfare:  losses.antiAircraftWarfare,
                                          specialEquipment:     losses.specialEquipment ?? 0,
                                          vehiclesAndFuelTanks: losses.vehiclesAndFuelTanks ?? 0,
                                          cruiseMissiles:       losses.cruiseMissiles ?? 0)
            
            if let correction = correctionEquipment.first(where: {$0.date == losses.date}) {
                lossesModel.aircraft =              correction.aircraft
                lossesModel.helicopter =            correction.helicopter
                lossesModel.tank =                  correction.tank
                lossesModel.apc =                   correction.apc
                lossesModel.fieldArtillery =        correction.fieldArtillery
                lossesModel.mrl =                   correction.mrl
                lossesModel.drone =                 correction.drone
                lossesModel.navalShip =             correction.navalShip
                lossesModel.antiAircraftWarfare =   correction.antiAircraftWarfare
                lossesModel.specialEquipment =      correction.specialEquipment
                lossesModel.vehiclesAndFuelTanks =  correction.vehiclesAndFuelTanks
                lossesModel.cruiseMissiles =        correction.cruiseMissiles
            }
            result.append(lossesModel)
        }
        
        return result
    }
    
    func loadDetails(type: LossesType) async throws -> [LossesDetailModel] {
        
        let details = try await api.fetchData(url: Requests.getEquipmentOryx.path!, EquipmentOryxData.self)
        let filtered = details.filter({ $0.equipmentUa == type.equipmentOryx() })
        return filtered.map({ LossesDetailModel(amount: $0.lossesTotal,
                                                model: $0.model,
                                                manufacturer: $0.manufacturer) })
    }
    
}
