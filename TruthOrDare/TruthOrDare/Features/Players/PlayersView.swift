//
//  PlayersView.swift
//  TruthOrDare
//
//  Created by Belén Grande López on 5/12/23.
//

import SwiftUI

struct PlayersView: View {
    @State private var playerName = ""
    @State private var nameList: [String] = []
    @State private var showAlert = false
    @State private var isPlaySelectTruthOrDareViewActive = false
    @State private var alertMessage = ""
    @State private var showConfirmAlert: Bool = false

    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    TextField(NSLocalizedString("add_name_button_players_view", comment: ""), text: $playerName)
                        .font(Font.custom("Alex-Murphy-Solid", size: 30))
                        .multilineTextAlignment(.leading)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .padding(.horizontal, 16)
                        .padding(.top, 48)
                        .autocapitalization(.words)

                    HStack {
                        Button(action: {
                            addName()
                        }) {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(12)
                        }
                        .padding(.top, 8)
                    }
                    .padding(.leading, 16)
                }

                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(nameList.indices, id: \.self) { index in
                            HStack {
                                Text(nameList[index])
                                    .font(Font.custom("Alex-Murphy-Solid", size: 50))
                                    .padding()

                                Spacer()

                                Button(action: {
                                    removeName(at: index)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                        .padding()
                                }
                            }
                        }
                    }
                }
                Spacer()

                Button(action: {
                    if nameList.isEmpty {
                        showAlert(message: NSLocalizedString("error_message_names", comment: ""))
                    } else {
                        isPlaySelectTruthOrDareViewActive = true
                    }
                }) {
                    Text(NSLocalizedString("play_button_players_view", comment: ""))
                        .font(Font.custom("Alex-Murphy-Solid", size: 50))
                        .frame(width: 180, height: 70)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(12)
                }
                .padding(.bottom, 16)
                .navigationDestination(isPresented: $isPlaySelectTruthOrDareViewActive) {
                    SelectTruthOrDareView()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text(NSLocalizedString("et_players_view", comment: ""))
                            .font(Font.custom("Alex-Murphy-Solid", size: 65))
                            .bold()
                            .foregroundColor(Color.black)
                            .padding(.top, 24)
                    }
                }
            }                    
            .navigationBarBackButtonHidden(true)
            .padding(.horizontal, 16)
            .alert(isPresented: $showAlert) {
                Alert(title: Text(NSLocalizedString("error_alert", comment: "")), message: Text(alertMessage), dismissButton: .default(Text(NSLocalizedString("confirmation_button", comment: ""))))
            }
        }
    }
    
    func saveNameList(_ nameList: [String]) {
        UserDefaults.standard.set(nameList, forKey: "NameListKey")
    }
    
    func removeName(at index: Int) {
        nameList.remove(at: index)
        saveNameList(nameList)
    }
    
    private func addName(){
        if playerName.isEmpty {
            showAlert(message: NSLocalizedString("error_message_no_names_list", comment: ""))
        } else {
            nameList.append(playerName)
            saveNameList(nameList)
            playerName = ""
        }
    }
    
    private func showAlert(message: String) {
        alertMessage = message
        showAlert = true
    }
}

#Preview {
    PlayersView()
        .environmentObject(Coordinator())
}
