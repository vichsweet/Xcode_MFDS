//
//  TelaInicialView.swift
//  telainicial
//
//  Created by found on 13/08/24.
//

import SwiftUI

struct TelaInicialView: View {
    @Binding var isFuvestFavorited: Bool
    @Binding var isEnemFavorited: Bool
    @Binding var isUeceFavorited: Bool

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Spacer().frame(height: 10)

                // Título "Bem-vindo"
                HStack {
                    Spacer().frame(width: 20)
                    Text("Bem-vindo")
                        .bold()
                        .font(.system(size: 30))
                    Spacer()
                }

                Spacer().frame(height: 20)

                // Título "Meus Vestibulares"
                HStack {
                    Spacer().frame(width: 20)
                    Text("Meus Vestibulares")
                        .bold()
                        .font(.system(size: 25))
                    Spacer()
                }

                // Verifica qual imagem mostrar
                VStack {
                    // Se nenhum favorito estiver selecionado, exibe a imagem padrão
                    if !isFuvestFavorited && !isUeceFavorited {
                        Image("Frame 8") // Imagem padrão
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250)
                            .padding()
                    } else {
                        // Se algum vestibular foi favoritado, exibe as imagens selecionadas
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                if isFuvestFavorited {
                                    NavigationLink(destination: InformacoesVestibularesView()) {
                                        Image("card_fuvest")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 250)
                                            .padding()
                                    }
                                }

                                if isUeceFavorited {
                                    Image("card_uece") // Imagem da UECE
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 250)
                                        .padding()
                                }
                            }
                        }
                    }
                }

                Spacer().frame(height: 10)

                // Título "Datas Importantes"
                HStack {
                    Spacer().frame(width: 20)
                    Image(systemName: "newspaper")
                    Text("Datas Importantes")
                        .bold()
                        .font(.system(size: 25))
                    Spacer()
                }

                Spacer()

                // ScrollView horizontal com vestibulares (mantém o comportamento original)
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        VStack {
                            Text("Fuvest")
                                .bold()
                                .font(.system(size: 22))
                            Image("Frame 10")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .clipped()
                                .padding(5)
                        }

                        VStack {
                            Text("Enem")
                                .bold()
                                .font(.system(size: 22))
                            Image("Frame 7")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .clipped()
                                .padding(5)
                        }

                        VStack {
                            Text("Uece")
                                .bold()
                                .font(.system(size: 22))
                            Image("Frame 5")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .clipped()
                                .padding(5)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    TelaInicialView(isFuvestFavorited: .constant(false), isEnemFavorited: .constant(false), isUeceFavorited: .constant(false))
}
