//
//  BuscaCursoView.swift
//  telainicial
//
//  Created by found on 30/07/24.
//

import SwiftUI



// View principal para buscar cursos
struct BuscaCursoView: View {
    @State private var searchTextEstado = ""
    @State private var searchTextCidade = ""
    @State private var searchTextCurso = ""
    @State private var showingEstados = false
    @State private var showingCidades = false
    @State private var showingCursos = false
    @State private var selectedEstado = ""
    @State private var selectedCidade = ""
    @State private var selectedCurso = ""

    // Lista de estados e suas principais cidades
    let estadosCidades = [
        "Acre": ["Rio Branco", "Cruzeiro do Sul", "Sena Madureira"],
        "Alagoas": ["Maceió", "Arapiraca", "Palmeira dos Índios"],
        "Amapá": ["Macapá", "Santana", "Laranjal do Jari"],
        "Amazonas": ["Manaus", "Parintins", "Itacoatiara"],
        "Bahia": ["Salvador", "Feira de Santana", "Vitória da Conquista"],
        "Ceará": ["Fortaleza", "Juazeiro do Norte", "Sobral"],
        "Distrito Federal": ["Brasília"],
        "Espírito Santo": ["Vitória", "Vila Velha", "Serra"],
        "Goiás": ["Goiânia", "Aparecida de Goiânia", "Anápolis"],
        "Maranhão": ["São Luís", "Imperatriz", "Caxias"],
        "Mato Grosso": ["Cuiabá", "Várzea Grande", "Rondonópolis"],
        "Mato Grosso do Sul": ["Campo Grande", "Dourados", "Três Lagoas"],
        "Minas Gerais": ["Belo Horizonte", "Uberlândia", "Contagem"],
        "Pará": ["Belém", "Ananindeua", "Santarém"],
        "Paraíba": ["João Pessoa", "Campina Grande", "Patos"],
        "Paraná": ["Curitiba", "Londrina", "Maringá"],
        "Pernambuco": ["Recife", "Jaboatão dos Guararapes", "Olinda"],
        "Piauí": ["Teresina", "Parnaíba", "Picos"],
        "Rio de Janeiro": ["Rio de Janeiro", "Niterói", "São Gonçalo"],
        "Rio Grande do Norte": ["Natal", "Mossoró", "Parnamirim"],
        "Rio Grande do Sul": ["Porto Alegre", "Caxias do Sul", "Pelotas"],
        "Rondônia": ["Porto Velho", "Ji-Paraná", "Ariquemes"],
        "Roraima": ["Boa Vista", "Rorainópolis", "Caracaraí"],
        "Santa Catarina": ["Florianópolis", "Joinville", "Blumenau"],
        "São Paulo": ["São Paulo", "Campinas", "Santos"],
        "Sergipe": ["Aracaju", "Nossa Senhora do Socorro", "Itabaiana"],
        "Tocantins": ["Palmas", "Araguaína", "Gurupi"]
    ]

    // Lista de cursos de graduação
    let cursos = [
        "Engenharia de Software",
        "Medicina",
        "Direito",
        "Arquitetura",
        "Psicologia",
        "Administração",
        "Ciências Contábeis",
        "Enfermagem",
        "Design Gráfico",
        "Fisioterapia",
        "Educação Física",
        "Biomedicina",
        "Farmácia",
        "Engenharia Civil",
        "Odontologia",
        "Engenharia da Computação"
    ]

    var estados: [String] {
        return Array(estadosCidades.keys).sorted()
    }

    var cidades: [String] {
        let todasCidades = estadosCidades.flatMap { $0.value }
        return todasCidades.sorted()
    }

    var filteredEstados: [String] {
        if searchTextEstado.isEmpty {
            return []
        } else {
            return estados.filter { $0.localizedCaseInsensitiveContains(searchTextEstado) }
        }
    }

    var filteredCidades: [String] {
        if searchTextCidade.isEmpty {
            return []
        } else {
            return cidades.filter { $0.localizedCaseInsensitiveContains(searchTextCidade) }
        }
    }

    var filteredCursos: [String] {
        if searchTextCurso.isEmpty {
            return []
        } else {
            return cursos.filter { $0.localizedCaseInsensitiveContains(searchTextCurso) }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                Image("Frame 4")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Em que estado planeja estudar?")
                            .bold()
                            .font(.system(size: 20))
                        
                        // Barra de pesquisa para Estados
                        TextField("Buscar estado", text: $searchTextEstado, onEditingChanged: { isEditing in
                            withAnimation {
                                showingEstados = isEditing
                            }
                        })
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.top, 10)
                        
                        // Lista de estados filtrados
                        if showingEstados {
                            List(filteredEstados, id: \.self) { estado in
                                Button(action: {
                                    selectedEstado = estado
                                    searchTextEstado = estado
                                    searchTextCidade = ""
                                    showingEstados = false
                                    showingCidades = true
                                }) {
                                    Text(estado)
                                }
                            }
                            .frame(height: 150)
                        }
                        
                        // Barra de pesquisa para Cidades
                        Text("Selecione a cidade")
                            .bold()
                            .font(.system(size: 20))
                            .padding(.top, 20)
                        
                        TextField("Buscar cidade", text: $searchTextCidade, onEditingChanged: { isEditing in
                            withAnimation {
                                showingCidades = isEditing && !selectedEstado.isEmpty
                            }
                        })
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.top, 10)
                        .disabled(selectedEstado.isEmpty) // Desabilita se o estado não foi selecionado

                        // Lista de cidades filtradas
                        if showingCidades && !selectedEstado.isEmpty {
                            List(filteredCidades, id: \.self) { cidade in
                                Button(action: {
                                    selectedCidade = cidade
                                    searchTextCidade = cidade
                                    showingCidades = false
                                    showingCursos = true
                                }) {
                                    Text(cidade)
                                }
                            }
                            .frame(height: 150)
                        }
                        
                        // Barra de pesquisa para Cursos
                        Text("Que curso você deseja fazer?")
                            .bold()
                            .font(.system(size: 20))
                            .padding(.top, 20)
                        
                        TextField("Buscar curso", text: $searchTextCurso, onEditingChanged: { isEditing in
                            withAnimation {
                                showingCursos = isEditing && !selectedEstado.isEmpty && !selectedCidade.isEmpty
                            }
                        })
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.top, 10)
                        .disabled(selectedCidade.isEmpty) // Desabilita se a cidade não foi selecionada

                        // Lista de cursos filtrados
                        if showingCursos && !selectedCidade.isEmpty {
                            List(filteredCursos, id: \.self) { curso in
                                Button(action: {
                                    selectedCurso = curso
                                    searchTextCurso = curso
                                    showingCursos = false
                                }) {
                                    Text(curso)
                                }
                            }
                            .frame(height: 150)
                        }

                        // Sempre exibe "Suas opções"
                        VStack(alignment: .center) {
                            Text("Suas opções")
                                .bold()
                                .font(.system(size: 30))
                                .padding(.top, 20)

                            // Verifica se o estado é Ceará, a cidade é Fortaleza e o curso é Engenharia da Computação
                            if selectedEstado == "Ceará" && selectedCidade == "Fortaleza" && selectedCurso == "Engenharia da Computação" {
                                NavigationLink(destination: InformacoesCursoView()) {
                                    Image("Group 77") // Certifique-se que a imagem "Group 77" está no assets do projeto
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 320, height: 54)
                                }
                                .frame(maxWidth: .infinity)
                                .multilineTextAlignment(.center)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 30)
                }
                .padding(.top, -30)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BuscaCursoView()
    }
}

