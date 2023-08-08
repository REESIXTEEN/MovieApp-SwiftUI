//
//  SplashView.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 7/8/23.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive:Bool = false
    
    var body: some View {
        VStack {
            Text("Awesome Splash Screen!")
                .font(Font.largeTitle)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                print("a")
            }
        }
    }
    
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
