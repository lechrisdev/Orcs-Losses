//
//  LossesDetailsView.swift
//  Orcs Losses
//
//  Created by Le Chris on 27.08.2023.
//

import SwiftUI

struct LossesDetailsView: View {
    
    @ObservedObject var viewModel: LossesDetailsViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            BackgroundFire(withVideo: false)
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 0) {
                Text(viewModel.type.title())
                    .font(.system(size: 42))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                HStack(spacing: 0) {
                    Text("знищено ")
                        .font(.system(size: 28))
                        .fontWeight(.ultraLight)
                        .foregroundColor(.white)
//                    if let currentLosses = viewModel.currentLosses {
//                        Text(String(currentLosses.day))
                    Text(String(viewModel.lossesAmount))
                            .font(.system(size: 28))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
//                    }
                    Text(" одиниць")
                        .font(.system(size: 28))
                        .fontWeight(.ultraLight)
                        .foregroundColor(.white)
                }
                .padding(.bottom, 50)
                ScrollView {
                    ForEach(viewModel.equipments, id: \.model) { equipment in
                        DetailCell(model: equipment)
                    }
                }
            }
            .padding(.horizontal, 16)
            Text(viewModel.errorMessage)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .padding(20)
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.red)
                }
                .offset(y: viewModel.showError ? 0 : 150)
        }.background {
            
        }
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(false)
    }
}

struct DetailCell: View {
    
    var model: LossesDetailModel
    
    init(model: LossesDetailModel) {
        self.model = model
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                HStack(spacing: 0) {
                    Spacer()
                    Text("Знищено:")
                        .font(.system(size: 20))
                        .fontWeight(.ultraLight)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.white)
                        .padding(.trailing, 15)
                }
                .frame(width: 120)
                HStack(spacing: 0) {
                    Text(String(model.amount))
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                    Spacer()
                }
                .frame(width: 200)
            }
            HStack(alignment: .top, spacing: 0) {
                HStack(spacing: 0) {
                    Spacer()
                    Text("Модель:")
                        .font(.system(size: 20))
                        .fontWeight(.ultraLight)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.white)
                        .padding(.trailing, 15)
                }
                .frame(width: 120)
                HStack(spacing: 0) {
                    Text(model.model)
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                    Spacer()
                }
                .frame(width: 200)
            }
            HStack(spacing: 0) {
                HStack(spacing: 0) {
                    Spacer()
                    Text("Виробник:")
                        .font(.system(size: 20))
                        .fontWeight(.ultraLight)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.white)
                        .padding(.trailing, 15)
                }
                .frame(width: 120)
                HStack(spacing: 0) {
                    Text(model.manufacturer)
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                    Spacer()
                }
                .frame(width: 200)
            }
        }
        .padding(.bottom, 50)
    }
    
}

struct LossesDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LossesDetailsView(viewModel: LossesDetailsViewModel(repo: Repository(),
                                                            router: Router(),
                                                            type: .cruiseMissiles))
    }
}
