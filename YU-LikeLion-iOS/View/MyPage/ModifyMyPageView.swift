//
//  ModifyMyPageView.swift
//  YU-LikeLion-iOS
//
//  Created by 아우신얀 on 2/7/24.
//

import SwiftUI
struct ModifyMyPageView: View {

    @State var showingPhoto = false
    @State var image : UIImage?
    @Binding var firstNaviLinkActive: Bool
    @State private var user =  [User]()
    @State private var departmentInput = ""
    @State private var partInput = ""
    @State private var emailInput = ""
    @State private var gitHubInput = ""
    
    var body: some View {
  
        ScrollView (showsIndicators: false) {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 398, height: 300)
                    VStack {
                        
                        Button(action: {
                            self.showingPhoto.toggle()
                        }, label: {
                            let selected = image == nil ? Image("Image") : Image(uiImage : image!)
                            selected
                                .resizable()
                                .frame(width: 130, height: 130)
                                .clipShape(Circle())
    
                        })
                        .clipShape(Circle())
                        .sheet(isPresented: $showingPhoto) {
                            UIImagePicker(sourceType: .photoLibrary) { (image) in
                                self.image = image
                            }
                        }
                        Text("홍길동")
                            .padding()
                            .font(.system(size: 30, weight: .heavy))
                    }
                }
               
                    ZStack {
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 360, height: 50)
                    }
                
              
                
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("MyPageColor"), lineWidth: 2)
                            .frame(width: 360, height: 50)
                        HStack {
                            Image("DepartmentIcon")
                            TextField("학과를 입력해주세요.", text: $departmentInput)
                        }
                        .padding(.leading, 30)
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("MyPageColor"), lineWidth: 2)
                            .frame(width: 360, height: 50)
                        HStack {
                            Image("PartIcon")
                            TextField("어떤 파트를 맡고 있나요? (FE/BE/UIUX)", text: $partInput)
                        }
                        .padding(.leading, 20)
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("MyPageColor"), lineWidth: 2)
                            .frame(width: 360, height: 50)
                        HStack {
                            
                            Image("EmailIcon")
                            TextField("이메일을 알려주세요.", text: $emailInput)
                        }
                        .padding(.leading, 20)
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("MyPageColor"), lineWidth: 2)
                            .frame(width: 360, height: 50)
                        HStack {
                            Image("GithubIcon")
                            TextField("깃허브 주소를 남겨주세요.", text: $gitHubInput)
                        }
                        .padding(.leading, 20)

                        
                    }
                }
            }
            .toolbar {
                Button("Done") {
                    firstNaviLinkActive = false
                    addUserInformation()
                    print(user)
                }
            }
            Spacer()
            
        }
    }
        func addUserInformation() {
            let newUser = User(department: departmentInput, part: partInput, email: emailInput, gitHub: gitHubInput)
            user.append(newUser)
            print(user)
        }

        
    }


#Preview {
    ModifyMyPageView(firstNaviLinkActive: .constant(true))
}


