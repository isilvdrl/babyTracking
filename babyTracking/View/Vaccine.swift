//
//  Vaccine.swift
//  babyTracking
//
//  Created by IŞIL VARDARLI on 5.11.2024.
//

import SwiftUI

struct Vaccine: View {
    var body: some View {
        ZStack{
            Color.gray.edgesIgnoringSafeArea(.all)
            VStack{
                Text("Aşı Takvimi")
                    .font(.title)
                    .foregroundStyle(.black)
                Spacer()
                
                
            }
        }
    }
}

#Preview {
    Vaccine()
}
