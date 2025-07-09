//
//  ContentView.swift
//  Pokedex
//
//  Created by heman on 09/07/25.
//

import SwiftUI

struct ContentView: View {
    var pokemodel = PokemonModel()
    @State private var pokemon = [Pokemon] ()
    var body: some View {
        NavigationView {
            List(pokemon) { poke in
                HStack {
                    VStack (alignment: .leading, spacing: 5) {
                        Text(poke.name.capitalized)
                            .font(.title)
                        Text(poke.type.capitalized)
                            .italic()
                        Text(poke.description)
                            .font(.caption)
                            .lineLimit(2)
                        
                    }
                    
                    AsyncImage(url: URL(string: poke.imageURL)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                            
                        case .success(let image):
                            image.resizable()
                                .interpolation(.none)
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                            
                        case .failure:
                            Image(systemName: "photo")
                            
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
            }
            .navigationTitle("Pokemon")
        }
        
        .onAppear {
            async {
                pokemon = try! await pokemodel.getPokemon()
            }
        }
    }
}

#Preview {
    ContentView()
}
