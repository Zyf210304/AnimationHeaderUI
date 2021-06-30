//
//  Home.swift
//  AnimationHeaderUI
//
//  Created by 张亚飞 on 2021/6/28.
//

import SwiftUI

struct Home: View {
    
    @StateObject var headerData = HeaderViewModel()
    
    init() {
        
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            HeaderView()
                .zIndex(1)
                .offset(y: headerData.headerOffset)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 15) {
                    
                    ForEach(1...5, id: \.self) { index in
                        
                        Image("p\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: rect.width - 30, height: 250)
                            .cornerRadius(4)
                    }
                }
                .padding(.top, 70)
                .overlay(
                
                    
                    GeometryReader { proxy -> Color in
                    
                        let minY = proxy.frame(in: .global).minY
                        
                    DispatchQueue.main.async {
                        
                        if headerData.startMinY == 0 {
                            
                            headerData.startMinY = minY
                        }
                        
                        let offset = headerData.startMinY - minY
                        
                        if offset > headerData.offset {
                            
                            headerData.bottomScrollOffset = 0
                            
                            if headerData.topScrollOffset == 0 {
                                
                                headerData.topScrollOffset = offset
                            }
                            
                            let progress = (headerData.topScrollOffset + getMaxOffset()) - offset
                            
                            let offsetCondition = (getMaxOffset() + getMaxOffset()) >= progress && getMaxOffset() - progress <= getMaxOffset()
                            let headerOffset = offsetCondition ? -(getMaxOffset() - progress) : -getMaxOffset()
                            headerData.headerOffset = headerOffset
                            
//                            print(progress)
                        }
                        
                        if offset > headerData.offset {
                            
                            headerData.topScrollOffset = 0
                            
                            if headerData.bottomScrollOffset == 0 {
                                
                                headerData.bottomScrollOffset = offset
                            }
                            
                            withAnimation(.easeOut(duration: 0.25)) {
                                
                                let headerOffset = headerData.headerOffset
                                
                                headerData.headerOffset = headerData.bottomScrollOffset > offset + 40 ? 0 : (headerOffset != -getMaxOffset() ? 0 : headerOffset)
                            }
                        }
                        
                        headerData.offset = offset
                    }
                        return Color.clear
                    }
                        .frame(height: 1)
                    
                    ,alignment: .top
                    
                )
            }
        }
    }
    
    //getting max top offset
    func getMaxOffset() -> CGFloat {
        
        return headerData.startMinY + (edges?.top ?? 0) + 10
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

var edges = UIApplication.shared.windows.first?.safeAreaInsets

var rect = UIScreen.main.bounds

struct HeaderView: View {
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        
        HStack (spacing: 20){
            
            Image(systemName: "play.fill")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 10, height: 10)
                .padding(.horizontal, 10)
                .padding(.vertical, 7)
                .background(Color.red)
                .cornerRadius(5)
            
            Text("Youtube")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            //word spacing
                .kerning(0.5)
                .offset(x: -10)
            
            Spacer()
            
            Button {
                
            } label: {
                
                Image(systemName: "display")
                    .font(.title2)
                    .foregroundColor(.primary)
            }
            
            Button {
                
            } label: {
                
                Image(systemName: "bell")
                    .font(.title2)
                    .foregroundColor(.primary)
            }
            
            Button {
                
            } label: {
                
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundColor(.primary)
            }

            Button {
                
            } label: {
                
                Image("profile")
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background((scheme == .dark ? Color.black : Color.white).ignoresSafeArea(.all, edges: .top))
        .overlay(
        
            Divider()
            
            ,alignment: .bottom
        )
    }
}
