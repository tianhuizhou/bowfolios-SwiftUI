//
//  ContentView.swift
//  Bowfolios-swiftUI
//
//  Created by Tianhui Zhou on 8/31/20.
//  Copyright © 2020 Tianhui Zhou. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseAuth

struct ContentView: View {
    
    @EnvironmentObject var session: SessionStore
    //    @State var infoOne: String = ""
    //    @State var infoTwo: String = ""
    func getUser(){
        session.listen()
    }
    
    func getSomething() {
        print("test1")
    }
    var body: some View {
        Group{
            if session.session != nil {
                
                Text("homeview")
                
                
                
            }
            else {
                // AddInfo()
                AuthView()
                
            }
        }.onAppear(perform: getUser)
        //.onAppear(perform: getSomething)
    }
    
    //    func readData(){
    //        let db = Firestore.firestore()
    //        db.collection("wine").document("tianhui").getDocument {(document, error) in
    //
    //            if error == nil {
    //
    //                if document != nil && document!.exists {
    //
    //                    let documentData = document!.data()
    //
    //                    self.infoOne = (documentData?["day"] as? String)!
    //                    self.infoTwo = (documentData?["month"] as? String)!
    //                }
    //            }
    //        }
    //    }
}

//struct HomeView: View {
//    //@EnvironmentObject var session: SessionStore
//
//    var body: some View {
//        NavigationView{
//            SecondView()
//        }
//    }
//}

struct SecondView: View {
    
    @State var infoOne: String = ""
    @State var infoTwo: String = ""
    @EnvironmentObject var session: SessionStore
    
    func test(){
        print("second should be same as: \(self.infoOne)")
    }
    
    func readData(){
        let userId = session.session?.uid
        print("test in readData function: \(userId ?? "fail")")
        let db = Firestore.firestore()
        db.collection("wine").document("\(userId ?? "tianhui")").getDocument {(document, error) in
            
            if error == nil {
                
                if document != nil && document!.exists {
                    
                    let documentData = document!.data()
                    
                    self.infoOne = (documentData?["day"] as? String)!
                    print("first test: \(self.infoOne)!!!")
                    self.infoTwo = (documentData?["month"] as? String)!
                    
                }
            }
        }
        
        
        
        
    }
    
    
    var body: some View {
        VStack{
            
            Text(infoOne)
            Text(infoTwo)
            Text("Here is Home view!")
            Button(action: session.signOut){
                Text("Quit")
                
            }.padding()
            
            NavigationLink(destination: AddInfo()){
                Text("gogogo")
            }
            
            
        }.onAppear(perform: readData)
    }
}

struct AddInfo: View {
    @State var day: String = ""
    @State var month: String = ""
    
    func addData(){
        let db = Firestore.firestore()
        db.collection("wine").document("tianhui").setData(["day": self.day, "month": self.month])
    }
    
    var body: some View{
        VStack{
            TextField("name", text: $day)
                .font(.system(size: 14))
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.black), lineWidth: 1))
            
            
            TextField("say something", text: $month).font(.system(size: 14))
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.black), lineWidth: 1))
            
            Button(action: addData){
                Text("Update it")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .background(Color.green)
            }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SessionStore())
        
    }
}
