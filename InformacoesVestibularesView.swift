//
//  InformacoesVestibularesView.swift
//  telainicial
//
//  Created by found on 23/09/24.
//

import SwiftUI

struct InformacoesVestibularesView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                // Título "FUVEST"
                Text("FUVEST")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color("azul"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                Divider()
                    .frame(width: 80, height: 2)
                    .background(Color("azul"))
                    .padding(.horizontal)
                
                InformationBoxView(title: "Isenção da taxa:", content: """
                • Estudantes de baixa renda.
                • Estudantes que cursaram o ensino médio em escolas públicas.
                • Prazo para solicitação de isenção geralmente em julho.
                """)
                
                InformationBoxView(title: "Estrutura", content: """
                1ª fase:
                • 90 questões de múltipla escolha (5 alternativas cada).
                • Áreas abordadas: Matemática, Física, Química, Biologia, Geografia, História, Língua Portuguesa, Inglês e Artes.
                
                2ª fase:
                • Questões dissertativas.
                • Redação (tema dissertativo-argumentativo).
                """)
                
                HStack(spacing: 16) {
                    InformationSmallBoxView(title: "Taxa de Inscrição", content: "Geralmente em torno de R$ 190.")
                    InformationSmallBoxView(title: "Modalidade", content: "Presencial.")
                }
                .padding(.horizontal)
            }
        }
        .padding(.top)
        .background(Color(.systemGray6))
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Componentes para as caixas de informação
struct InformationBoxView: View {
    var title: String
    var content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(content)
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(Color(.systemGray5))
        .cornerRadius(10)
        .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 4)
        .padding(.horizontal)
    }
}

struct InformationSmallBoxView: View {
    var title: String
    var content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(content)
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(Color(.systemGray5))
        .cornerRadius(10)
        .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 4)
    }
}

#Preview {
    InformacoesVestibularesView()
}
