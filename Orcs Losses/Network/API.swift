//
//  API.swift
//  Orcs Losses
//
//  Created by Le Chris on 27.08.2023.
//

import Foundation

class API {
    
    func fetchData<SomeData: Decodable>(url: URL, _ dataModel: SomeData.Type) async throws -> SomeData {
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        let result = try JSONDecoder().decode(dataModel, from: data)
            return result
    }
}

protocol EndPoint {
    var path: URL? { get }
}

enum Requests: EndPoint {
    case getLossesEquipment
    case getCorrectionEquipment
    case getEquipmentOryx
    case getLossesPersonnel
    
    var path: URL? {
        switch self {
        case .getLossesEquipment:
            return Bundle.main.url(forResource: "russia_losses_equipment", withExtension: "json")
        case .getCorrectionEquipment:
            return Bundle.main.url(forResource: "russia_losses_equipment_correction", withExtension: "json")
        case .getEquipmentOryx:
            return Bundle.main.url(forResource: "russia_losses_equipment_oryx", withExtension: "json")
        case .getLossesPersonnel:
            return Bundle.main.url(forResource: "russia_losses_personnel", withExtension: "json")
        }
    }
}

