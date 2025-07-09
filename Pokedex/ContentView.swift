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
                Text(poke.name)
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
