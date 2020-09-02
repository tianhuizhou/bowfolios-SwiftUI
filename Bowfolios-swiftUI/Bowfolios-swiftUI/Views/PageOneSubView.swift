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
                    
                    Text(profile.Name)
                    Text(profile.Email)
                    Text(profile.Title)
                    
                }
            }
        }.onAppear {
            self.profileModel.getAllProfiles()
        }
    }
}

struct ProfileRowView: View {
    
    var body: some View{
        VStack{
        HStack(){
            VStack(alignment: .leading){
            Text("name")
                .font(.title)
                .fontWeight(.medium)
                
            
            Text("Title")
                .font(.subheadline)
                .foregroundColor(Color.gray)
                
            }.padding(.bottom, 20)
            
            Spacer()
            
            Image("turtlerock").resizable().frame(width: 50.0, height: 50.0)
        }.padding(.horizontal)
            HStack(){
            Text("there is a description about myself, personal imformation.")
                .multilineTextAlignment(.leading)
                
                Spacer()
            }.padding(.horizontal)
            HStack{
                Text("Basketball")
                    .font(.system(size: 11))
                    .fontWeight(.heavy)
                    .foregroundColor(Color(.white))
                    .multilineTextAlignment(.center)
                    .padding(.all,5)
                    .background(Color("Color-label"))
            }
        }
        
    }
}

struct PageOneSubView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileRowView()
    }
}
