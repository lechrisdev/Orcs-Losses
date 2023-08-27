//
//  ContentView.swift
//  Orcs Losses
//
//  Created by Le Chris on 27.08.2023.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .center, spacing: 0) {
                Text("Втрати росії")
                    .font(.system(size: 42))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                HStack(spacing: 0) {
                    Text("станом на ")
                        .font(.system(size: 28))
                        .fontWeight(.ultraLight)
                        .foregroundColor(.white)
                    if let currentLosses = viewModel.currentLosses {
                        Text(String(currentLosses.day))
                            .font(.system(size: 28))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    Text(" день війни")
                        .font(.system(size: 28))
                        .fontWeight(.ultraLight)
                        .foregroundColor(.white)
                }
                Spacer()
                VStack {
                    if let currentLosses = viewModel.currentLosses {
                        LossesView(losses: currentLosses,
                                   rowTapped: { row in
                            viewModel.haptic()
                            viewModel.router.navigateToLossesDetailsView(type: row)
                        })
                    }
                }
                Spacer()
                HStack(spacing: 0) {
                    Button(action: {
                        viewModel.moveTo(.backward)
                    }, label: {
                        Image("Previous")
                            .padding(.trailing, 15)
                            .opacity(viewModel.isButtonActive(.backward) ? 1 : 0.3)
                    })
                    if let currentLosses = viewModel.currentLosses {
                        Text(currentLosses.date)
                            .font(.system(size: 36))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .frame(width: 230)
                            .padding(.trailing, 15)
                    }
                    Button(action: {
                        viewModel.moveTo(.forward)
                    }, label: {
                        Image("Next")
                            .opacity(viewModel.isButtonActive(.forward) ? 1 : 0.3)
                    })
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
            BackgroundFire()
                .ignoresSafeArea()
        }
//        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(repo: Repository(),
                                          router: Router()))
    }
}
