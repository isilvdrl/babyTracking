//
//  CustomDatePicker.swift
//  babyTracking
//
//  Created by IŞIL VARDARLI on 6.11.2024.
//

import SwiftUI

struct CustomDatePicker: View {
  
    @Binding var currentDate: Date
    @State var currentMonth: Int = 0
    
    var body: some View {
        
        VStack(spacing:35){
            //Days
            let days:[String] = ["Pazar","Pzt", "Salı", "Çrş", "Prş", "Cuma", "Crt" ]
            
            HStack(spacing: 20){
                
                VStack(alignment: .leading, spacing: 10){
                    Text(extraDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    Text(extraDate()[1])
                        .font(.title.bold())
                    
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        currentMonth -= 1
                    }
                },label: {Image(systemName: "chevron.left")
                        .font(.title2)
                })
                
                Button(action: {
                    withAnimation {
                        currentMonth = 1
                    }
                },
                       label: {Image(systemName: "chevron.right")
                        .font(.title2)
                })
            }.padding(.horizontal)
            
            //Day View
            HStack(spacing:0){
                ForEach(days, id: \.self){day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                    
                }
            }
            
            //Dates
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 15){
                ForEach(extractDate()){value in
                    cardView(value: value)
                        .background(
                            Capsule()
                                .fill(Color("Pink"))
                                .padding(.horizontal,8)
                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                        )
                        .onTapGesture{
                            currentDate = value.date
                        }
                }
            }
            VStack(spacing: 15){
                Text("Tasks")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.vertical,20)
                if let task = tasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: currentDate)
                }){
                    ForEach(task.task){task in
                        VStack(alignment: .leading, spacing: 10){
                            Text(task.time.addingTimeInterval(CGFloat.random(in: 0...5000)),style: .time)
                            Text(task.title)
                                .font(.title2.bold())
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            Color("Pink")
                                .opacity(0.5)
                                //.clipShape(Capsule())
                                .cornerRadius(10)
                        )
                    }
                }
                else{
                    Text("No Tasks Found")
                }
            }
            
            
            
        }
        .onChange(of: currentMonth){ newValue in
            currentDate = getCurrentMonth()
        }
    }
    @ViewBuilder
    func cardView(value: DateValue)-> some View{
        VStack{
            if value.day != -1{
                if let task = tasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: value.date)
                    
                }){
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    Circle()
                        .fill(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : Color("Pink"))
                        .frame(width: 8,height: 8)
                }else
                {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
            }
        }
        .padding(.vertical, 8)
        .frame(height: 60, alignment: .top)
    }
    
    func isSameDay(date1:Date , date2: Date) -> Bool{
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    func extraDate()-> [String]{
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        let date = formatter.string(from: currentDate)
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth()-> Date{
        
        let calendar = Calendar.current
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth , to: Date())
        else {return Date()}
        
        return currentMonth
    }
    
    func extractDate()-> [DateValue]{
        let calendar = Calendar.current
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDates().compactMap{ date -> DateValue in
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }
        
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday-1{
            days.insert(DateValue(day: -1, date: Date()),at:0)
        }
        return days
    }
}

#Preview {
    ContentView()
}
extension Date{
    func getAllDates()->[Date] {
        let calendar = Calendar.current
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!

        
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
