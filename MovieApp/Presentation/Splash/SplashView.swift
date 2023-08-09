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
        Text("SplashView")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
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
