//
//  MainScreenTabView.swift
//  SwiftUIMoviesCarousel
//
//  Created by Sandeep Maurya on 02/11/23.
//

import SwiftUI

struct MainScreenTabView: View {
    
    init() {
        UITabBar.appearance().barTintColor = .systemBackground
        UINavigationBar.appearance().barTintColor = .systemBackground
    }
    
    @State var selectedIndex = 0
    @State var shouldShowModel = false
    
    let tabBarImageNames = ["pencil", "lasso", "plus.app.fill",  "gear", "person"]
    
    var body: some View{
        VStack(spacing: 0) {
            
            Spacer()
                .fullScreenCover(isPresented: $shouldShowModel) {
                    Button {
                        shouldShowModel.toggle()
                    } label: {
                        Text("New Post")
                    }
                }
            ZStack {
                switch selectedIndex {
                case 0:
                    MoviesView()
                default:
                    Text("Second")
                }
            }
            
            Spacer()
            
            HStack {
                ForEach(0..<5){num in
                    Button {
                        if num == 2{
                            shouldShowModel.toggle()
                            return
                        }
                        selectedIndex = num
                    } label: {
                        Spacer()
                        
                        if num == 2{
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(.red)
                        }else {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(selectedIndex == num ? Color.black : .gray)
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

struct MainScreenTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenTabView()
    }
}
