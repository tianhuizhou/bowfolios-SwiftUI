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
        //NavigationView{
        Group{
            //judging the current user State with Firebase Auth
            if session.session != nil {
                
                //user already logged in
                //NavigationView{
                    HomeView()
                //}
                
            }
            else {
                // no available loggin state
                AuthView()
                
            }
        }.onAppear(perform: getUser)
      
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
