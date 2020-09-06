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
    @State var size = UIScreen.main.bounds.width / 1.6
    
    var body: some View {
        //NavigationView{
        ZStack{
            
        VStack{
            TopBar(selected: $selected, size: $size)

            PagesView(selected: $selected)
            
            Button(action: {
                self.profileModel.getAllProfiles()
            }){
                Text("Click me to refresh the page")
            }
            
        }.edgesIgnoringSafeArea(.top)
            
            HStack{
                
                menu(size: $size)
                .cornerRadius(20)
                    .padding(.leading, -size)
                    .offset(x: -size)
                
                Spacer()
            }.edgesIgnoringSafeArea(.vertical)
            
        }.animation(.spring())
           // }
    }
}

// MARK: - PagesView
struct PagesView: View {
    @EnvironmentObject var session: SessionStore
    @Binding var selected: Int
    var body: some View{
        GeometryReader{ _ in
            
            VStack{
                
                Pages(currentPage: self.$selected) {
                     //PageOneSubView()
                     PageOneSubView()
                     PageTwoSubView()
                     PageThreeSubView()
                    Button(action: {
                        self.session.signOut()
                    }){
                        Text("Quit the app")
                    }
                     
                   Circle() // The 4th page is a Circle
                }
            }
        }
    }
}


// MARK: - Navigation Bar

struct TopBar: View {
    
    @EnvironmentObject var session: SessionStore
    @Binding var selected: Int
    @State var imageIcon: UIImage?
    @Binding var size: CGFloat
    
    @State var photo: UIImage?
    
    func getPhoto(){
        let imagePath = session.session?.uid
        if imagePath != nil {
            Storage.storage().reference().child(imagePath!).getData(maxSize: 5 * 1024 * 1024) { (imageData, err) in
                if let err = err {
                    print("an error has happened - \(err.localizedDescription)")
                } else {
                    if let imageData = imageData {
                        self.photo = UIImage(data: imageData)
                    } else {
                        print("couldn't unwrap image data!")
                    }
                }
            }
        } else {
            print("image is setted to default")
        }
    }
    
    
    var body: some View{
        
        ZStack{
        
        VStack(){
            
            HStack{
                
                Button(action: {
                    self.size = 10
                    print(self.size)
                }) {
                    if photo == nil {
                    Image("turtlerock").renderingMode(.original).resizable().scaledToFit().frame(width:50, height: 50).clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 10)
                        
                    }else{
                        Image(uiImage: photo!).renderingMode(.original).resizable().scaledToFit().frame(width:50, height: 50).clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .shadow(radius: 10)
                    }
                }
                
                Spacer()
                
                Text("Bowfolios").font(.system(size: 20)).fontWeight(.semibold).foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    //self.selected = 8
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
                    Text("Interests").fontWeight(.semibold).foregroundColor(self.selected == 1 ? .white: Color.white.opacity(0.5))
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
                
            }//.padding(.top)
            
        }.padding().padding(.top, (UIApplication.shared.windows.last?.safeAreaInsets.top)! + 0).background(Color("Color-1"))
        
        //.padding(.top, (UIApplication.shared.windows.last?.safeAreaInsets.top)! + 0)
            
            
        }.onAppear {
            self.getPhoto()
        }
        
    }
}

struct menu : View {
    @EnvironmentObject var session: SessionStore
    @Binding var size : CGFloat
    @State var editView: Bool = false
    
    var body : some View{
       // ZStack{
        VStack{
            Spacer()
            HStack{
                
                Spacer()
                
                Button(action: {
                    
                    self.size =  UIScreen.main.bounds.width / 1.6
                }) {
                    
                    Image(systemName: "arrow.left").resizable().frame(width: 15, height: 15).padding()
                }.background(Color.red)
                    .foregroundColor(.white)
                .clipShape(Circle())
            }
            
            Spacer()
            HStack{
                
                Button(action: {
                    withAnimation {
                        self.editView.toggle()
                    }
                }){
                    Image(systemName: "pencil.circle.fill").resizable().frame(width: 25, height: 25).padding()
                               
                    Text("Edit").fontWeight(.regular)
                }
                .sheet(isPresented: $editView, content:{
                    PageThreeSubView()
                })
                           
                Spacer()
            }.padding(.leading, 20)
            
            Spacer()
            HStack{
                
                Button(action: {
                    self.session.signOut()
                }) {
                    Image(systemName: "clear.fill").resizable().frame(width: 25, height: 25).padding()
                    
                    Text("Quit").fontWeight(.regular)
                }
                
                
                Spacer()
            }.padding(.leading, 20)
            Spacer()
        }.background(Color.white).frame(width: UIScreen.main.bounds.width / 1.6)
       // if u want to change swipe menu background color
        
            
    //}
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        HomeView()
        }
    }
}
