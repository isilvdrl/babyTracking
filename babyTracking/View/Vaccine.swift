//
//  Vaccine.swift
//  babyTracking
//
//  Created by IŞIL VARDARLI on 5.11.2024.
//

import SwiftUI

struct Vaccine: View {

    @State var currentDate: Date = Date()
    var body: some View {
        ScrollView(.vertical , showsIndicators: false){
            VStack(spacing: 20){
                CustomDatePicker(currentDate: $currentDate)
            }
        }
     
    }
}

#Preview {
    Vaccine()
}

