//
//  Homepage.swift
//  babyTracking
//
//  Created by IŞIL VARDARLI on 24.10.2024.
//

import SwiftUI
import Kingfisher

struct Homepage: View {
    var screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            Color.white
            .edgesIgnoringSafeArea(.all)
            
            KFImage(URL(string:"https://img.freepik.com/premium-vector/cute-baby-with-toy-blocks-smile-cartoon-vector-art_1080480-148710.jpg"))
                .resizable()
                .frame(height:screen.height/2)
                .zIndex(0)
                .aspectRatio(contentMode: .fit)
                .padding(.top, -450)
           
            VStack(){
               
                    HStack() {
                        
                        Spacer()
                        Button(action: {},
                               label: {
                            Image(systemName: "person.crop.circle")
                                .font(.system(size:30))
                        }).padding(.trailing,20)
                        
                    }.foregroundColor(.pink)
                    .padding(.top, 0)
                
                Spacer()
                GroupedSmallButtons()
                    .padding(.top,-200)
                GroupedBigButtons()
                    .padding(.bottom,100)
                
                
            }.zIndex(1)
        }
    }
}

#Preview {
    Homepage()
}

struct GroupedSmallButtons: View {
    var screen = UIScreen.main.bounds
    var body: some View {
        HStack{
            Button(action:{},
                   label:{
                VStack {
                    Image("diaper")
                        .resizable()
                        .frame(width: 100,height:100)
                        
                    Text("Diaping").font(.system(size:20))
                }
            })
            Button(action:{},
                   label:{
                VStack {
                    Image("feeding")
                        .resizable()
                        .frame(width: 100,height:100)
                        
                    Text("Feeding").font(.system(size:20))
                }
            })
            Button(action:{},
                   label:{
                VStack {
                    Image("sleeping")
                        .resizable()
                        .frame(width: 100,height:100)
                        
                    Text("Sleeping").font(.system(size:20))
                }
            })
        }.foregroundColor(.pink)
         
        
    }
}




struct GroupedBigButtons: View {
    var body: some View {
        HStack{
            Button(action: {},
                   label: {
                VStack {
                    Image(systemName: "person.crop.circle")
                        .font(.system(size:80))
                    Text("Aşı Takibi")
                }
            })
            Button(action: {},
                   label: {
                VStack {
                    Image(systemName: "person.crop.circle")
                        .font(.system(size:80))
                    Text("Boy Kilo Takibi")
                }
            })
            
        }
        .foregroundColor(.pink)
      
    }
}
