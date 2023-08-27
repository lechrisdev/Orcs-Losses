//
//  LossesView.swift
//  Orcs Losses
//
//  Created by Le Chris on 27.08.2023.
//

import SwiftUI

struct LossesView: View {
    
    let losses: LossesModel
    var rowTapped: (LossesType) -> Void
    
    
    init(losses: LossesModel, rowTapped: @escaping (LossesType) -> Void) {
        self.losses = losses
        self.rowTapped = rowTapped
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            RowCell(amount: losses.personnel,
                    image: Image("Personnel"),
                    name: "особового складу",
                    type: .personnel,
                    onTapRow: {type in rowTapped(type)})
            RowCell(amount: losses.aircraft,
                    image: Image("Aircraft"),
                    name: "літаки",
                    type: .aircraft,
                    onTapRow: {type in rowTapped(type)})
            RowCell(amount: losses.helicopter,
                    image: Image("Helicopter"),
                    name: "гелікоптери",
                    type: .helicopter,
                    onTapRow: {type in rowTapped(type)})
            RowCell(amount: losses.tank,
                    image: Image("Tank"),
                    name: "танки",
                    type: .tank,
                    onTapRow: {type in rowTapped(type)})
            RowCell(amount: losses.apc,
                    image: Image("APC"),
                    name: "БТР",
                    type: .apc,
                    onTapRow: {type in rowTapped(type)})
            RowCell(amount: losses.fieldArtillery,
                    image: Image("FieldArtillery"),
                    name: "польова артилерія",
                    type: .fieldArtillery,
                    onTapRow: {type in rowTapped(type)})
            RowCell(amount: losses.mrl,
                    image: Image("MRL"),
                    name: "артилерійські системи",
                    type: .mrl,
                    onTapRow: {type in rowTapped(type)})
            RowCell(amount: losses.drone,
                    image: Image("Drone"),
                    name: "дрони",
                    type: .drone,
                    onTapRow: {type in rowTapped(type)})
            RowCell(amount: losses.navalShip,
                    image: Image("NavalShip"),
                    name: "морські кораблі",
                    type: .navalShip,
                    onTapRow: {type in rowTapped(type)})
            Group {
                RowCell(amount: losses.antiAircraftWarfare,
                        image: Image("AntiAircraftWarfare"),
                        name: "ППО",
                        type: .antiAircraftWarfare,
                        onTapRow: {type in rowTapped(type)})
                RowCell(amount: losses.specialEquipment,
                        image: Image("SpecialEquipment"),
                        name: "спецтехніка",
                        type: .specialEquipment,
                        onTapRow: {type in rowTapped(type)})
                RowCell(amount: losses.vehiclesAndFuelTanks,
                        image: Image("VehiclesAndFuelTanks"),
                        name:  "транспортні засоби та паливні баки",
                        type: .vehiclesAndFuelTanks,
                        onTapRow: {type in rowTapped(type)})
                RowCell(amount: losses.cruiseMissiles,
                        image: Image("CruiseMissiles"),
                        name: "крилаті ракети",
                        type: .cruiseMissiles,
                        onTapRow: {type in rowTapped(type)})
            }
        }
    }
}

struct RowCell: View {
    
    var amount: Int
    var image: Image
    var name: String
    var type: LossesType
    var onTapRow: (LossesType) -> Void
    
    init(amount: Int, image: Image, name: String, type: LossesType, onTapRow: @escaping (LossesType) -> Void) {
        self.amount = amount
        self.image = image
        self.name = name
        self.type = type
        self.onTapRow = onTapRow
    }
    
    var body: some View {
        Button(action: {
            onTapRow(type)
        }, label: {
            HStack(alignment: .top, spacing: 0) {
                HStack(spacing: 0) {
                    Spacer()
                    Text(String(amount))
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.white)
                }
                .frame(width: 100)
                image
                    .foregroundColor(.white)
                    .padding(.horizontal, 15)
                Text(name)
                    .font(.system(size: 20))
                    .fontWeight(.ultraLight)
                    .underline(type.equipmentOryx() != "", color: .white.opacity(0.2))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
            }
        })
        .disabled(type.equipmentOryx() == "")
    }
}

struct LossesView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            LossesView(losses: LossesModel(date:                 "26.08.2023",
                                           day:                  529,
                                           personnel:            252200,
                                           aircraft:             315,
                                           helicopter:           311,
                                           tank:                 4237,
                                           apc:                  8262,
                                           fieldArtillery:       4965,
                                           mrl:                  705,
                                           drone:                4126,
                                           navalShip:            18,
                                           antiAircraftWarfare:  466,
                                           specialEquipment:     734,
                                           vehiclesAndFuelTanks: 7441,
                                           cruiseMissiles:       1359),
                       rowTapped: {_ in})
        }
    }
}
