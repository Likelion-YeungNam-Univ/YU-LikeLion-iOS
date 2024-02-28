//
//  MyPageView.swift
//  YU-LikeLion-iOS
//
//  Created by 아우신얀 on 2/7/24.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        ScrollView (showsIndicators: false) {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color("MyPageColor"))
                        .frame(width: 398, height: 300)
                    VStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .padding(.leading, 320)
                                .foregroundStyle(Color.gray)
                                .font(.system(size:20))
                        }
                        Image("Image")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        Text("홍길동")
                            .padding()
                            .font(.system(size: 30, weight: .heavy))
                    }
                }
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("MyPageColor"))
                            .frame(width: 360, height: 50)
                        HStack {
                            Text("\(Text("홍길동").foregroundStyle(Color("MainColor")))님의 정보를 설정하기")
                                .font(.system(size: 20, weight: .heavy))
                                .foregroundStyle(Color.black)
                                .padding(.trailing, 100)
                            
                            Image(systemName: "chevron.right")
                                .foregroundStyle(Color.gray)
                        }
                    }
                }
                .padding()
                
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("MyPageColor"), lineWidth: 2)
                            .frame(width: 360, height: 50)
                        HStack {
                            Image("DepartmentIcon")
                            Text("아직 학과를 입력하지 않았어요.")
                                .padding(.trailing, 80)
                        }
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("MyPageColor"), lineWidth: 2)
                            .frame(width: 360, height: 50)
                        HStack {
                            Image("PartIcon")
                            Text("아직 학과를 입력하지 않았어요.")
                                .padding(.trailing, 80)
                        }
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("MyPageColor"), lineWidth: 2)
                            .frame(width: 360, height: 50)
                        HStack {
                            
                            Image("EmailIcon")
                            Text("아직 학과를 입력하지 않았어요.")
                                .padding(.trailing, 80)
                        }
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("MyPageColor"), lineWidth: 2)
                            .frame(width: 360, height: 50)
                        HStack {
                            
                            Image("GithubIcon")
                            Text("아직 학과를 입력하지 않았어요.")
                                .padding(.trailing, 80)
                            
                        }
                    }
                }
                VStack {
                    Text("내가 쓴 글")
                        .font(.system(size: 25, weight: .heavy))
                        .padding()
                        .padding(.trailing, 250)
                }
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}


#Preview {
    MyPageView()
}
