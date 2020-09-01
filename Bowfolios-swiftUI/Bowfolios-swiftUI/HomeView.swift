//
//  HomeView.swift
//  Bowfolios-swiftUI
//
//  Created by Tianhui Zhou on 8/31/20.
//  Copyright © 2020 Tianhui Zhou. All rights reserved.
//

import SwiftUI
import Pages


struct HomeView: View {
    //@State var index: Int = 0
    @State var selected = 0
    var body: some View {
        
        VStack{
            TopBar(selected: $selected)
            GeometryReader{ _ in
                
                VStack{
                    
                    Pages(currentPage: self.$selected) {
                         Text("Welcome! This is Page 1")
                         Text("This is Page 2")
                         Text("...and this is Page 3")
                         Circle() // The 4th page is a Circle
                         PageOne()
                         PageOne()
                    }
                }
            }
        }.edgesIgnoringSafeArea(.top)
    }
}

struct PageOne: View {
    var body: some View{
        VStack {
        Spacer()
        HStack {
            
            Text("Page 1")
            
        }
    }
}
}

//struct PageViews: View {
//    @State var index: Int = 0
//    var body: some View{
//                Pages(currentPage: $index) {
//                     Text("Welcome! This is Page 1")
//                     Text("This is Page 2")
//                     Text("...and this is Page 3")
//                     Circle() // The 4th page is a Circle
//                     PageOne()
//                }
//    }
//}


struct TopBar: View {
    
    @Binding var selected: Int
    var body: some View{
        VStack(spacing: 20){
            HStack{
                Text("Bowfolios").font(.system(size: 20)).fontWeight(.semibold).foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    self.selected = 8
                }){
                    Image(systemName: "plus").font(.headline).foregroundColor(.white)
                    
                    
                }
            }
            HStack{
                Button(action: {
                    
                    self.selected = 0
                   
                }){
                    Text("test1").fontWeight(.semibold).foregroundColor(self.selected == 0 ? .white: Color.white.opacity(0.5))
                }
                Spacer(minLength: 8)
                
                Button(action: {
                    self.selected = 1
                }){
                    Text("test2").fontWeight(.semibold).foregroundColor(self.selected == 1 ? .white: Color.white.opacity(0.5))
                }
                Spacer(minLength: 8)
                
                Button(action: {
                    self.selected = 2
                }){
                    Text("test3").fontWeight(.semibold).foregroundColor(self.selected == 2 ? .white: Color.white.opacity(0.5))
                }
                Spacer(minLength: 8)
                
                Button(action: {
                    self.selected = 3
                }){
                    Text("test4").fontWeight(.semibold).foregroundColor(self.selected == 3 ? .white: Color.white.opacity(0.5))
                }
                Spacer(minLength: 8)
                
                Button(action: {
                    self.selected = 4
                }){
                    Text("test5").fontWeight(.semibold).foregroundColor(self.selected == 4 ? .white: Color.white.opacity(0.5))
                }
                
            }.padding(.top)
            
        }.padding().padding(.top, (UIApplication.shared.windows.last?.safeAreaInsets.top)! + 10).background(Color("Color"))
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
