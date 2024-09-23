//
//  CronogramaView.swift
//  telainicial
//
//  Created by found on 30/07/24.
//

import SwiftUI

struct CronogramaView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Imagem de topo
                Image("Frame 4")
                    .resizable()
                    .scaledToFit() // Ajusta a imagem para se ajustar ao espaço sem distorção
                    .frame(maxWidth: .infinity) // Garante que a imagem ocupe toda a largura disponível
                    .clipped() // Garante que a imagem não exceda os limites da tela
                    .ignoresSafeArea(edges: .top) // Ignora a área segura no topo
                    .frame(height: 200) // Ajuste a altura conforme necessário
                
                ScrollView { // ScrollView principal
                    VStack(spacing: 20) {
                        // Scroll horizontal para os textos
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(["24 semanas", "48 semanas", "60 semanas", "48 semanas", "24 semanas", "48 semanas"], id: \.self) { text in
                                    Text(text)
                                        .padding(.horizontal)
                                        .padding(.vertical, 5)
                                        .background {
                                            Capsule()
                                                .fill(Color.white)
                                                .shadow(color: Color.black.opacity(0.3), radius: 7, x: 30, y: 7)
                                                .overlay(
                                                    Capsule()
                                                        .strokeBorder(Color.black, lineWidth: 1)
                                                )
                                        }
                                }
                            }
                            .padding(.horizontal)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)

                        // "Mais acessados" no canto superior esquerdo
                        HStack {
                            Text("Mais acessados")
                                .bold()
                                .font(.system(size: 30))
                                .padding(.leading, 20)
                                .padding(.top, 5)
                            Spacer()
                        }

                        // Seções de texto com bordas responsivas
                        HStack(spacing: 20) {
                            VStack {
                                Text("intensivo")
                                    .background(Color.white)
                                    .foregroundColor(.black)
                                    .font(.headline)
                                    .frame(maxWidth: .infinity, minHeight: 200)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 33)
                                            .stroke(LinearGradient(
                                                gradient: Gradient(colors: [.black, .black]),
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            ), lineWidth: 3)
                                    )
                            }
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.45)

                            VStack {
                                Text("cronograma para matemática")
                                    .background(Color.white)
                                    .foregroundColor(.black)
                                    .font(.headline)
                                    .frame(maxWidth: .infinity, minHeight: 200)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 33)
                                            .stroke(LinearGradient(
                                                gradient: Gradient(colors: [.black, .black]),
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            ), lineWidth: 3)
                                    )
                            }
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.45)
                        }
                        .padding(.horizontal, 20)

                        VStack(spacing: 10) {
                            Text("Personalize seu cronograma")
                                .background(Color.white)
                                .foregroundColor(.black)
                                .font(.headline)
                                .frame(maxWidth: .infinity, minHeight: 200)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 33)
                                        .stroke(LinearGradient(
                                            gradient: Gradient(colors: [.black, .black]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        ), lineWidth: 3)
                                )
                        }
                        .padding(.horizontal, 20)

                        Spacer(minLength: 0)
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 0)
                }
                .background(Color.white)
            }
            .navigationBarTitle("") // Remove o título da barra de navegação
            .navigationBarHidden(true) // Oculta a barra de navegação
            .padding(0) // Remove qualquer padding no NavigationView
        }
        .ignoresSafeArea(edges: .bottom) // Ignora a área segura inferior
    }
}

#Preview {
    CronogramaView()
}
