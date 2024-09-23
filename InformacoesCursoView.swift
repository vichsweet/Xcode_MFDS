//
//  InformacoesCursoView.swift
//  telainicial
//
//  Created by found on 17/09/24.
//

import SwiftUI

struct InformacoesCursoView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Title
                Text("Engenharia da Computação")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                    .padding(.leading, 16)
                    .foregroundColor(.azul)
                
                // Duration Card
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Duração")
                            
                            
                            
                        Text("5 anos (10 semestres)")
                            .font(.subheadline)
                    }
                    Spacer()
                    // Graduation Cap Icon with Circle
                    Image(systemName: "graduationcap")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding()
                        .background(Circle().fill(Color.azul))
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
                .padding(.horizontal, 16)
                
                // Structure Card
                VStack(alignment: .leading, spacing: 5) {
                    Text("Estrutura")
                        .font(.headline)
                    Text("Programação, Estruturas de Dados, Sistemas Operacionais, Engenharia de Software, Arquitetura de Computadores, Redes de Computadores, e muitas outras.")
                        .font(.subheadline)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
                .padding(.horizontal, 16)
                
                // Admission and Modality
                HStack {
                    // Admission
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Formas de ingresso")
                            .font(.headline)
                        Text("Vestibular IFCE\nSisu")
                            .font(.subheadline)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                    
                    Spacer()
                    
                    // Modality
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Modalidade")
                            .font(.headline)
                        Text("Presencial")
                            .font(.subheadline)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                }
                .padding(.horizontal, 16)
                
                // Job Market Card
                VStack(alignment: .leading, spacing: 5) {
                    Text("Mercado de trabalho")
                        .font(.headline)
                    Text("Desenvolvimento de software e sistemas.\nEngenharia de redes e segurança da informação.\nDesenvolvimento de hardware e sistemas embarcados.\nConsultoria e gestão de projetos de TI.\nPesquisa e desenvolvimento em empresas de tecnologia e startups.")
                        .font(.subheadline)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
                .padding(.horizontal, 16)
            }
        }
    }
}

struct InformacoesCursoView_Previews: PreviewProvider {
    static var previews: some View {
        InformacoesCursoView()
    }
}
