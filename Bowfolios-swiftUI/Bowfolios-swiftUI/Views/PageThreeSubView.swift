//
//  PageThreeSubView.swift
//  Bowfolios-swiftUI
//
//  Created by Tianhui Zhou on 9/3/20.
//  Copyright © 2020 Tianhui Zhou. All rights reserved.
//

import SwiftUI
import FirebaseFirestoreSwift
import Firebase

struct PageThreeSubView: View {
    
    @EnvironmentObject var session: SessionStore
    @State private var name = ""
    @State private var title = ""
    @State private var bio = ""
    @State private var interests = ""
    @State private var projects = ""
    
    @State var showActionSheet = false
    @State var showImagePicker = false
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @State var image: UIImage?
    
    func editProfile() {
        let db = Firestore.firestore()
        let userid = session.session!.uid
        
        db.collection("Profiles").document("\(userid)").setData(["Bio": bio, "Email":session.session!.email, "Interests": [interests], "Name": name, "Projects": [projects], "Title": title])
    }
    
    var body: some View {
        VStack{
            
            HStack{
                Text("Name")
                    .font(.headline).multilineTextAlignment(.leading).padding(.horizontal)
                
                TextField("Full Name", text: $name)
                .font(.system(size: 14))
                .padding(12)
                
            }.background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray), lineWidth: 1))
            
            HStack{
                Text("Title   ")
                    .font(.headline).multilineTextAlignment(.leading).padding(.horizontal)
                
                TextField("Aka?", text: $title)
                .font(.system(size: 14))
                .padding(12)
                
            }.background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray), lineWidth: 1)).edgesIgnoringSafeArea(.all)
            
            HStack{
                Text("Bio     ")
                    .font(.headline).multilineTextAlignment(.leading).padding(.horizontal)
                
                TextField("Add a Bio to your profile", text: $bio)
                .font(.system(size: 14))
                    .padding(12)
                
            }
            .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray), lineWidth: 1)).edgesIgnoringSafeArea(.all)
            
            HStack{
                Text("Interests")
                    .font(.headline).multilineTextAlignment(.leading).padding(.horizontal)
                
                TextField("What do you like", text: $interests)
                .font(.system(size: 14))
                .padding(12)
                
            }.background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray), lineWidth: 1)).edgesIgnoringSafeArea(.all)
            
            
            HStack{
                Text("Projects")
                    .font(.headline).multilineTextAlignment(.leading).padding(.horizontal)
                
                TextField("your projects", text: $projects)
                .font(.system(size: 14))
                .padding(12)
                
            }.background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray), lineWidth: 1)).edgesIgnoringSafeArea(.all)
            
            Spacer()
            
            Button(action: editProfile){
                Text("Edit")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .background(Color.green)
            }
            
        Spacer()
            Button(action: {
                self.showActionSheet = true
            }) {
                if image == nil {
                    Text("pick a image")
                }else{
                    Text("got a image")
//                    Image(uiImage: image!).resizable().scaledToFit()
//                        .frame(width:50, height: 50)
                }
            }.actionSheet(isPresented: $showActionSheet){
                ActionSheet(title: Text("Add a picture"), message: nil, buttons: [
                //button 1
                    .default(Text("Camera"), action: {
                        self.showImagePicker = true
                        self.sourceType = .camera
                    }),
                    //button2
                    .default(Text("Photo library"), action: {
                        self.showImagePicker = true
                        self.sourceType = .photoLibrary
                    }),
                    
                    //button3
                    .cancel()
                ])
            }.sheet(isPresented: $showImagePicker){
                imagePicker(image: self.$image, showImagePicker: self.$showImagePicker, sourceType: self.sourceType)
                
            }
                
            
        }
    }
}

struct PageThreeSubView_Previews: PreviewProvider {
    static var previews: some View {
        PageThreeSubView()
    }
}
