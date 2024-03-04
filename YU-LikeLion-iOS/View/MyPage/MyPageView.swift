//
//  MyPageView.swift
//  YU-LikeLion-iOS
//
//  Created by 아우신얀 on 2/7/24.
//

import SwiftUI

struct MyPageView: View {
    
    @Binding var user: User
    @State var firstNaviLinkActive = false
    
    var body: some View {
        NavigationView {
            ScrollView (showsIndicators: false) {
                VStack {
                    ZStack {
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 398, height: 300)
                        VStack {
                            
                            Image("Image")
                                .resizable()
                                .frame(width: 130, height: 130)
                                .clipShape(Circle())
                            Text("이름")
                                .padding()
                                .font(.system(size: 30, weight: .heavy))
                        }
                    }
                    Button(action: {
                        
                    }) {
                        NavigationLink(destination: ModifyMyPageView(firstNaviLinkActive: $firstNaviLinkActive), isActive: $firstNaviLinkActive) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("MyPageColor"))
                                    .frame(width: 360, height: 50)
                                HStack {
                                    Text("\(Text("이름").foregroundStyle(Color("MainColor")))님의 정보를 설정하기")
                                        .font(.system(size: 20, weight: .heavy))
                                        .foregroundStyle(Color.black)
                                        .padding(.trailing, 100)
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(Color.gray)
                                }
                            }
                        }
                    }
                    .padding()
                }
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("MyPageColor"), lineWidth: 2)
                            .frame(width: 360, height: 50)
                        HStack {
                            
                            Image("DepartmentIcon")
                            if user.department.isEmpty {
                                Text(String(user.department))
                                //print(user.department)
                                    
                            } else {
                                Text(user.department)
                            }
                        }
                        .padding(.trailing, 160)
                        .onChange(of: user.department) { newValue in
                            print(newValue)
                        }
                        
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("MyPageColor"), lineWidth: 2)
                            .frame(width: 360, height: 50)
                        HStack {
                            
                            Image("PartIcon")
                            if user.part.isEmpty {
                                Text("아직 파트를 입력하지 않았어요.")
                                    
                            } else {
                                Text(user.part)
                            }
                        }
                        .padding(.trailing, 90)
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("MyPageColor"), lineWidth: 2)
                            .frame(width: 360, height: 50)
                        HStack {
                            
                            Image("EmailIcon")
                            if user.email.isEmpty {
                                Text("아직 이메일을 입력하지 않았어요.")
                            } else {
                                Text(user.email)
                            }
                            
                        }
                        .padding(.trailing, 70)
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("MyPageColor"), lineWidth: 2)
                            .frame(width: 360, height: 50)
                        HStack {
                            
                            Image("GithubIcon")
                            if user.email.isEmpty {
                                Text("아직 깃허브 주소를 입력하지 않았어요.")
                            } else {
                                Text(user.email)
                            }
                            
                        }
                        .padding(.trailing, 40)
                    }
                }
                VStack {
                    Text("내가 쓴 글")
                        .font(.system(size: 25, weight: .heavy))
                        .padding()
                        .padding(.trailing, 250)
                }
                .toolbar {
                    Button {
                        
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .padding(.leading, 320)
                            .foregroundStyle(Color.gray)
                            .font(.system(size:15))
                    }
                }
                
            }
            
            Spacer()
            
        }
        .tint(.gray)
    }
    
}



#Preview {
    MyPageView(user: Binding.constant(User(department: "", part: "", email: "", gitHub: "")))
}

