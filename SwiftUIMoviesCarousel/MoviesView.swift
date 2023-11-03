//
//  ContentView.swift
//  SwiftUIMoviesCarousel
//
//  Created by Sandeep Maurya on 02/11/23.
//

import SwiftUI

struct MoviesView: View {
    
    @State var animationAmount = 1.0
    @State var zoomIn = false
    let movies = ["captain-marvel","doctor-strange","captain-america","ant-man","captain-marvel","doctor-strange","captain-america","ant-man"]
    private func getScale(proxy: GeometryProxy) -> CGFloat{
        var scale: CGFloat = 1
        
        let x = proxy.frame(in: .global).minX
        
        let diff = abs(x)
        
        if diff < 100{
            scale = 1 + (100 - diff) / 500
        }
        
        return scale
    }
    
    var body: some View {
        NavigationView {
            ScrollView{
                ScrollView(.horizontal){
                    HStack(spacing: 50){
                        ForEach(movies, id: \.self) { movie in
                            GeometryReader { proxy in
                                NavigationLink {
                                    Text("Destination ")
                                } label: {
                                    VStack {
                                        let scale = getScale(proxy: proxy)
                                        
                                        Image(movie)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 150)
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 0.5)
                                            }
                                            .clipped()
                                            .cornerRadius(5)
                                            .shadow(radius: 10)
                                            .scaleEffect(CGSize(width: scale, height: scale))
                                        
                                        Text("Captain America")
                                            .padding(.top)
                                            .foregroundColor(Color(.label))
                                    }
                                }
                            }
                            .frame(width: 125, height: 300)
                        }
                    }.padding(32)
                }
                Spacer(minLength: 40)
                // Tap me Animated button
                Button {
                    zoomIn.toggle()
                } label: {
                    Text(zoomIn ? "Zoom Out" : "Zoom In")
                        .padding()
                }
                .padding()
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(Circle())
                .scaleEffect(zoomIn ? 2 : 1)
                .animation(.default, value: zoomIn ? 2 : 1)
            }
            .navigationTitle("Movies Carousel")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
