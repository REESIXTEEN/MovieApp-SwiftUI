//
//  SplashView.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 7/8/23.
//

import SwiftUI

struct SplashView: View {
    
    @State private var opacity = 1.0
    
    var body: some View {
        ZStack{
            Image(uiImage: UIImage(named: "AppIcon") ?? UIImage())
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(100)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)
        .opacity(opacity)
        .task{
            withAnimation(.linear(duration: 0.25).delay(1)) {
                opacity = 0
            }
        }

    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
