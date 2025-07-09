//
//  ContentView.swift
//  Pokedex
//
//  Created by heman on 09/07/25.
//

import SwiftUI
import Kingfisher

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
                        HStack {
                            Text(poke.type.capitalized)
                                .italic()
                            Circle()
                                .foregroundColor(poke.typeColor)
                                .frame(width: 10, height: 10)
                        }
                        Text(poke.description)
                            .font(.caption)
                            .lineLimit(2)
                        
                    }
                    
                    Spacer()
                    
                    KFImage(URL(string: poke.imageURL))
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 100, height: 100)
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
