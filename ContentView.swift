//
//  ContentView.swift
//  telainicial
//
//  Created by found on 26/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isFuvestFavorited: Bool = false // Estado para Fuvest
    @State private var isEnemFavorited: Bool = false   // Estado para Enem
    @State private var isUeceFavorited: Bool = false   // Estado para Uece

    var body: some View {
        NavigationView {
            TabView {
                // Tela inicial com estados individuais para cada vestibular
                TelaInicialView(isFuvestFavorited: $isFuvestFavorited, isEnemFavorited: $isEnemFavorited, isUeceFavorited: $isUeceFavorited)
                    .tabItem {
                        Label("Tela inicial", systemImage: "house")
                    }

                // Outra aba mostrando vestibulares
                VStack {
                    ScrollView {
                        VestibularesView(nome: "ENEM", descricao: "Exame Nacional do Ensino Médio", isFavorited: $isEnemFavorited)
                            .padding()
                        VestibularesView(nome: "Fuvest", descricao: "Datas e edital", isFavorited: $isFuvestFavorited)
                            .padding()
                        VestibularesView(nome: "Uece", descricao: "Datas e edital", isFavorited: $isUeceFavorited)
                            .padding()
                    }
                    .navigationTitle("Vestibulares")
                }
                .tabItem {
                    Label("Vestibulares", systemImage: "graduationcap")
                }

                // CronogramaView (outras abas)
                CronogramaView()
                    .tabItem {
                        Label("Cronogramas", systemImage: "calendar")
                    }

                // BuscaCursoView (outras abas)
                BuscaCursoView()
                    .tabItem {
                        Label("", systemImage: "map")
                    }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Configurações")
                    }) {
                        Image(systemName: "gear")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
