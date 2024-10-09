//
//  ContentView.swift
//  Clase11AnimationAsyncImage
//
//  Created by Escurra Colquis on 9/10/24.
//

import SwiftUI

struct ContentView: View {
    private let imageUrl = "https://www.ecartelera.com/carteles-series/300/380/001_m.jpg"
    
    var body: some View {
        VStack {
            Text("Imagen asíncrona\nde Dragon Ball Z")
                .bold()
                .font(.system(size: 30))
                .multilineTextAlignment(.center)
            Spacer()
            AsyncImage(url: URL(string: imageUrl), transaction: Transaction(animation: .spring(duration: 2.5))) {
                result in
                switch result {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .clipShape(.rect(cornerRadius: 24))
                        //.transition(.slide)
                        //.transition(.asymmetric(insertion: .scale, removal: .scale))
                        //.transition(.scale(scale: 5.0, anchor: .bottomTrailing))
                        //.transition(.scale)
                        //.transition(.scale(scale: 10.0))
                        //.transition(.push(from: .top))
                        //.transition(.move(edge: .top))
                        .transition(.move(edge: .leading))
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(lineWidth: 2.0))
                        .shadow(color: .gray, radius: 6, x: 5, y: 20)
                case .empty:
                    ProgressView()
                        .frame(width: 20, height: 20)
                        .tint(.gray)
                case .failure(_):
                    VStack {
                        Image(systemName: "clear")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.red)
                        Text("Error al cargar imagen")
                            .foregroundStyle(.red)
                            .font(.system(size: 20, weight: .medium))
                    }
                @unknown default:
                    fatalError()
                }
            }
            .frame(width: 320, height: 520)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
