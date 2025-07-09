//
//  StatView.swift
//  Pokedex
//
//  Created by heman on 09/07/25.
//

import SwiftUI

struct StatView: View {
    var pokemon: Pokemon
    var statName: String
    var statColor: Color
    var statValue: Int
    
    var body: some View {
        HStack {
            Text(statName)
                .font(.system(.body, design: .monospaced))
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.gray)
                    .frame(width: 150, height: 20)
                
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(statColor)
                    .frame(width: statValue<100
                    ? 150*(CGFloat(statValue)/100)
                    :
                            150,
                           height: 20
                            
                          )
            }
            Text("\(statValue)")
                .font(.system(.body, design: .monospaced))
            
        }
    }
}

#Preview {
    StatView(
        pokemon: PokemonViewModel().MOCK_POKEMON, statName: "atk", statColor: .blue, statValue: 55
    )
}
