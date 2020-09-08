//
//  PageTwoSubView.swift
//  Bowfolios-swiftUI
//
//  Created by Tianhui Zhou on 9/1/20.
//  Copyright © 2020 Tianhui Zhou. All rights reserved.
//

import SwiftUI
import Firebase

struct PageTwoSubView: View {
    
    @ObservedObject var profileViewModel = ProfileViewModel()
    @State var setPhoto: [UIImage] = []
    
//    func getPhoto(){
//        setPhoto = []
//        for imagePath in member{
//        if imagePath != "no" {
//            Storage.storage().reference().child(imagePath).getData(maxSize: 5 * 1024 * 1024) { (imageData, err) in
//                if let err = err {
//                    print("an error has happened - \(err.localizedDescription)")
//                } else {
//                    if let imageData = imageData {
//                        //self.photo = UIImage(data: imageData)
//                        self.setPhoto.append(UIImage(data: imageData)!)
//                    } else {
//                        print("couldn't unwrap image data!")
//                    }
//                }
//            }
//        } else {
//            print("image is setted to default")
//            }
//
//        }
//    }
    
    var body: some View {
        VStack{
                    ScrollView{
                        
                        ForEach(self.profileViewModel.interestsAndMembers, id: \.self) { inteSec in
                            InterestsGroupView(member: inteSec.members, title: inteSec.theInterest)
                        }
//                        .onAppear {
//                            self.getPhoto()
//                        }
                    }
        }.onAppear {
            self.profileViewModel.getAllProfiles()
        }
    }
    
}
    
    


struct InterestsGroupView: View {
    
    var member: [String]
    var title: String
    @State var setPhoto: [UIImage] = []
   // @State var photo: UIImage?
    func getPhoto(){
        setPhoto = []
        for imagePath in member{
        if imagePath != "no" {
            Storage.storage().reference().child(imagePath).getData(maxSize: 5 * 1024 * 1024) { (imageData, err) in
                if let err = err {
                    print("an error has happened - \(err.localizedDescription)")
                } else {
                    if let imageData = imageData {
                        //self.photo = UIImage(data: imageData)
                        self.setPhoto.append(UIImage(data: imageData)!)
                    } else {
                        print("couldn't unwrap image data!")
                    }
                }
            }
        } else {
            print("image is setted to default")
            }
            
        }
    }
    
    var body: some View {
        VStack{
            Text(title).font(.largeTitle)
            HStack{
                //display people's name who has the same interest
                ForEach(setPhoto, id: \.self) {photo in
                    Image(uiImage: photo).resizable().frame(width: 50.0, height: 50.0)
                }
                
                //in the future, there should display image instead of string
                Spacer()
                }.padding()
        }.onAppear(perform: {
            self.getPhoto()
        }).padding(.bottom)
    }
}

struct PageTwoSubView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        Text("hi")
    }
}
