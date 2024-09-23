//
//  VestibularesView.swift
//  telainicial
//
//  Created by found on 30/07/24.
//

import SwiftUI

struct VestibularesView: View {
    let nome: String
    let descricao: String
    @Binding var isFavorited: Bool

    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text(nome.uppercased())
                    Spacer()
                    Button {
                        isFavorited.toggle()
                    } label: {
                        Image(systemName: isFavorited ? "star.fill" : "star")
                            .foregroundStyle(.blue)
                    }
                }
                .font(.title)
                .padding()
                .padding(.top, 10)
                
                Color.black
                    .frame(height: 3)
                    .shadow(color: .gray, radius: 3, x: 0, y: 5)
                
                Spacer()
            }
            .frame(height: 200)
            .overlay {
                Text(descricao)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.black, lineWidth: 3)
            }
        }
    }
}

#Preview {
    VestibularesView(nome: "ENEM", descricao: "Exame Nacional do Ensino Médio", isFavorited: .constant(false))
}
