//
//  HeaderViewModel.swift
//  AnimationHeaderUI
//
//  Created by 张亚飞 on 2021/6/30.
//

import SwiftUI

class HeaderViewModel: ObservableObject {
   
    @Published var startMinY : CGFloat = 0
    
    @Published var offset : CGFloat = 0
    
    
    @Published var headerOffset : CGFloat = 0
    
    @Published var topScrollOffset : CGFloat = 0
    
    @Published var bottomScrollOffset : CGFloat = 0
}

