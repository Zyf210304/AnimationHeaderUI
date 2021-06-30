//
//  Home.swift
//  AnimationHeaderUI
//
//  Created by 张亚飞 on 2021/6/28.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        ZStack(alignment: .top) {
            
            HeaderView()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

var edges = UIApplication.shared.windows.first?.safeAreaInsets

struct HeaderView: View {
    
    var body: some View {
        
        HStack {
            
            Image(systemName: "play.fill")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 20, height: 20)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .background(Color.red)
                .cornerRadius(5)
                
        }
    }
}
