//
//  PageOneSubView.swift
//  Bowfolios-swiftUI
//
//  Created by Tianhui Zhou on 8/31/20.
//  Copyright © 2020 Tianhui Zhou. All rights reserved.
//

import SwiftUI

struct PageOneSubView: View {
    
    @State var profile = ""
    @ObservedObject var profileModel = ProfileViewModel()
    
    var body: some View {
        VStack{
            List{
                
                ForEach(self.profileModel.profiles){profile in
                    
//                    Text(profile.Name)
//                    Text(profile.Email)
//                    Text(profile.Title)
                    ProfileRowView(name: profile.Name, title: profile.Title, bio: profile.Bio, interest: profile.interests, project: profile.Projects)
                    
                }
            }
        }.onAppear {
            self.profileModel.getAllProfiles()
        }
    }
}

struct ProfileRowView: View {
    
    var name: String
    var title: String
    var bio: String
    var interest: [String]
    var project: [String]
    
    var body: some View{
        VStack{
        HStack(){
            VStack(alignment: .leading){
            Text(name)
                .font(.title)
                .fontWeight(.medium)
                
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(Color.gray)
                
            }.padding(.bottom, 20)
            
            Spacer()
            
            Image("turtlerock").resizable().frame(width: 50.0, height: 50.0)
        }//.padding(.horizontal)
            HStack(){
            Text(bio)
                .multilineTextAlignment(.leading)
                
                Spacer()
            }//.padding(.horizontal)
            HStack{
                
                ForEach(interest, id: \.self){it in
                Text(" \(it) ")
                    .font(.system(size: 11))
                    .fontWeight(.heavy)
                    .foregroundColor(Color(.white))
                    .multilineTextAlignment(.center)
                    .padding(.vertical,5)
                    .background(Color("Color-label"))
                    .cornerRadius(5)
                }
                
                Spacer()
            }.padding(.vertical)
            
            HStack{
                
                Text("Projects:")
                    .font(.headline)
                
                Spacer()
            }.padding(.bottom)
            
            HStack{
                
                ForEach(project, id: \.self) {pj in
                    Text("\(pj)").padding(.horizontal)
                }
                
                Spacer()
                
            }.padding(.bottom)
            
        }
        
    }
}

struct PageOneSubView_Previews: PreviewProvider {
    static var previews: some View {
        PageOneSubView()
    }
}
