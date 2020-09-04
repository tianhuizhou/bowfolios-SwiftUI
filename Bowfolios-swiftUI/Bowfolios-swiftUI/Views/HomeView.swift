//
//  HomeView.swift
//  Bowfolios-swiftUI
//
//  Created by Tianhui Zhou on 8/31/20.
//  Copyright © 2020 Tianhui Zhou. All rights reserved.
//

import SwiftUI
import Pages
import Firebase

struct HomeView: View {
    //@State var index: Int = 0
    @EnvironmentObject var session: SessionStore
    @ObservedObject var profileModel = ProfileViewModel()
    @State var selected = 0
    
    var body: some View {
        
        VStack{
            TopBar(selected: $selected)
            GeometryReader{ _ in
                
                VStack{
                    
                    Pages(currentPage: self.$selected) {
                         //PageOneSubView()
                         PageOneSubView(profileModel: self.profileModel)
                         PageTwoSubView(profileViewModel: self.profileModel)
                        Button(action: {
                            self.session.signOut()
                        }){
                            Text("Quit the app")
                        }
                         Text("This is Page 4")
                       // Text("asasas")
                         Circle() // The 4th page is a Circle
                         
                    }
                    
                }
                
            }
            
            Button(action: {
                self.profileModel.getAllProfiles()
            }){
                Text("Click me to refresh the page")
            }
            
        }.onAppear(perform: {
            self.profileModel.getAllProfiles()
        }).edgesIgnoringSafeArea(.top)
    
    }
}

// MARK: - Subviews

//struct PageOne: View {
//    @EnvironmentObject var session: SessionStore
//
//    var body: some View{
//        PageOneSubView()
//}
//
//}

//struct PageTwo: View {
//    @EnvironmentObject var session: SessionStore
//    
//    var body: some View{
//        
//}
//    
//}

// MARK: - Navigation Bar

struct TopBar: View {
    @EnvironmentObject var session: SessionStore
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
                    Text("Profiles").fontWeight(.semibold).foregroundColor(self.selected == 0 ? .white: Color.white.opacity(0.5))
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
            
        }.padding().padding(.top, (UIApplication.shared.windows.last?.safeAreaInsets.top)! + 10).background(Color("Color-1"))
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Text("asa")
    }
}
