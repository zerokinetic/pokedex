//
//  PokemonImage.swift
//  Pokedex
//
//  Created by heman on 09/07/25.
//

import SwiftUI
import Kingfisher

struct PokemonImage: View {
    var image: KFImage
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
            .background(Circle().foregroundColor(.white))
            .shadow(radius: 5)
    }
}

#Preview {
    PokemonImage(image: KFImage(URL(string: PokemonViewModel().MOCK_POKEMON.imageURL)))
}
