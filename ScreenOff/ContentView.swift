//
//  ContentView.swift
//  ScreenOff
//
//  Created by Rob Glazer on 11/22/24.
//

import SwiftUI

extension Color {
    static let redishWhite = Color(red: 242 / 255, green: 242 / 255, blue: 255 / 255) // #F2F2FF
    static let mediumGrey = Color(red: 53 / 255, green: 53 / 255, blue: 56 / 255) // #353538
    static let darkGrey = Color(red: 40 / 255, green: 41 / 255, blue: 47 / 255) // #28292F
    static let lightGrey = Color(red: 154 / 255, green: 154 / 255, blue: 167 / 255) // #9A9AA7
    static let profileBlue = Color(red: 9 / 255, green: 161 / 255, blue: 255 / 255) // #09A1FF
    static let profilePink = Color(red: 199 / 255, green: 30 / 255, blue: 228 / 255) // #C71EE4

    static let backgroundGrey = Color(red: 28/255, green: 30/255, blue: 38/255)


    
}



struct ScoreboardMainCell: View {
    let pfpColor: Color
    let time: String
    let name: String
    var body: some View{
        ZStack {
            Rectangle()
                .stroke(Color.mediumGrey, lineWidth: 1)
            HStack{
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white) // Fill color for the circle
                    .overlay(
                        Circle().strokeBorder(pfpColor, lineWidth: 4) // Border around the circle
                    )
                VStack{
                    Text(time)
                        .font(.custom("Poppins-Bold", size: 16))
                        .foregroundColor(.redishWhite)
                    Text(name)
                        .font(.custom("Poppins-Light", size: 16))
                        .foregroundColor(.lightGrey)

                    
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading) // Align text to the left
            .padding(.leading, 8)
        }

    }
    
}

struct CellRow: View {
    let leftText: String
    let centerText: String
    let rightText: String
    
    let cellHeight: CGFloat = 56

    var body: some View {
        HStack(spacing: 0) {
            // Left Cell
            ZStack {
                Rectangle()
                    //.fill(Color.black)
                    .stroke(Color.mediumGrey, lineWidth: 1)
                    .frame(height: cellHeight)
                Text(leftText)
                    .font(.custom("Poppins-Bold", size: 16))
                    .foregroundColor(.redishWhite)
                    .frame(maxWidth: .infinity, alignment: .leading) // Align text to the left
                    .padding(.leading, 16)

            }
            .frame(width: UIScreen.main.bounds.width * 0.42) // 40% width

            // Center Cell
            ZStack {
                Rectangle()
                    .fill(Color.darkGrey) // Medium grey fill
                    .stroke(Color.mediumGrey, lineWidth: 1) // Medium grey border
                    .frame(height: cellHeight) // Fixed height
                Text(centerText)
                    .font(.custom("Poppins-light", size: 12))
                    .foregroundColor(.lightGrey)
            }
            .frame(width: UIScreen.main.bounds.width * 0.16) // 20% width

            // Right Cell
            ZStack {
                Rectangle()
                    .stroke(Color.mediumGrey, lineWidth: 1)
                    .frame(height: cellHeight) // Fixed height
                Text(rightText)
                    .font(.custom("Poppins-Bold", size: 16))
                    .foregroundColor(.redishWhite)
                    .frame(maxWidth: .infinity, alignment: .leading) // Align text to the left
                    .padding(.leading, 16)
            }
            .frame(width: UIScreen.main.bounds.width * 0.42) // 40% width
        }
    }
}




struct ContentView: View {
    //Gonna omit avg for now, think this could belong somewhere else
    let leftTimes = ["8h 12m", "6h 4m", "5h 26m", "3h 30m", "6h 5m", "3h 47m", "----", "29h 17m"]//, "6h 1m"]
    let days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun", "TOTAL"]//, "AVG"]
    let rightTimes = ["7h 13m", "4h 59m", "7h 15m", "3h 49m", "5h 23m", "6h 41m", "----", "28h 39m"]//, "5h 44m"]

    var body: some View {
        ZStack {
            Color.backgroundGrey
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                //HEADER:
                HStack {
                    Button(action: {
                        print("Chevron tapped")
                    }) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.mediumGrey)
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                            .padding(.leading, 16)
                    }

                    Spacer()

                    Text("Vesidious")
                        .font(.custom("Poppins-Bold", size: 16))
                        .foregroundColor(.redishWhite)
                        .padding(.trailing, 16)

                    Spacer()

                }
                //TABS
                

                HStack {
                    let tab_margins: CGFloat = 72

                    Text("MATCHUP")
                        .font(.custom("Poppins-Bold", size: 20))
                        .foregroundColor(.redishWhite)
                        .padding(.leading, tab_margins)

                    Spacer()
                    Text("LEAGUE")
                        .font(.custom("Poppins-Bold", size: 20))
                        .foregroundColor(.redishWhite)
                        .padding(.trailing, tab_margins)

                }
                .padding(.top, 16)
                .padding(.bottom, 8)
                
                
                //SCOREBOARD
                ZStack(alignment: .topLeading) {
                    HStack(spacing: 0) {
                        ScoreboardMainCell(pfpColor: Color.profileBlue, time: "3h 47m", name: "Rob")
                            .frame(height: 104) // Ensure consistent height

                        ScoreboardMainCell(pfpColor: Color.profilePink, time: "6h 41m", name: "Ryan")
                            .frame(height: 104) // Ensure consistent height
                    }
                        //RED LINE UNDER MATCHUP:
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 120, height: 3)
                        .offset(x: 62, y: -1)
                        //RED LINE UNDER LEAGUE:
//                    Rectangle()
//                        .fill(Color.red)
//                        .frame(width: 120, height: 3)
//                        .offset(x: 232, y: -1)
                    

                }

                
                //This ZStack will be where I put those little scroll circle things. Later..
                ZStack {
                    Rectangle()
                        .stroke(Color.mediumGrey, lineWidth: 1) // Medium grey border
                        .frame(height: 24)
                    HStack(spacing: 5) {
                        ForEach(0..<5, id: \.self) { index in
                            Circle()
                                .fill(index == 0 ? Color.clear : Color.mediumGrey)
                                .overlay(
                                    Circle()
                                        .stroke(Color.lightGrey, lineWidth: 1)
                                        .opacity(index == 0 ? 1 : 0)
                                )
                                .frame(width: 8, height: 8)
                        }
                    }

                }
                //TUG-O-WAR
                ZStack{
                    Rectangle()
                        .fill(Color.mediumGrey) // Grey color for the line
                        .frame(width: 1) // Width of the line
                        .frame(maxHeight: .infinity) // Makes the line span the entire height of the ZStack

                    VStack (spacing: 0){
                        ZStack () { // Align items to the left
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.mediumGrey)
                                .frame(height: 24)
                                .padding(.horizontal, 24)
                                .padding(.bottom, 8)
                            HStack (spacing: 0){
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.profileBlue)
                                    .frame(width: 96, height: 24)
                                
                                Spacer()
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.profilePink) // Set to red color
                                    .frame(width: 140, height: 24)
                            }
                            .padding(.bottom, 8)
                            .padding(.horizontal, 24)
                            
                            let claimedIndices = [0, 1, 4, 5, 6]
                            
                            HStack(spacing: 32) {
                                ForEach(0..<7, id: \.self) { index in
                                    Circle()
                                        .fill(claimedIndices.contains(index) ? Color.white : Color.backgroundGrey)
                                        .overlay(
                                            Circle()
                                                .stroke(claimedIndices.contains(index) ? Color.backgroundGrey : Color.white
                                                        , lineWidth: 1)
                                        )
                                        .frame(width: index == 3 ? 22 : 12, height: index == 3 ? 22 : 12)
                                    
                                }
                            }
                            .padding(.top, 12)
                            
                        }
                        
                        
                        HStack{
                            Text("2 To Win")
                                .font(.custom("Poppins-Light", size: 16))
                                .foregroundColor(.lightGrey)
                                .padding(.leading, 40)
                            Spacer()
                            Text("1 To Win")
                                .font(.custom("Poppins-Light", size: 16))
                                .foregroundColor(.lightGrey)
                                .padding(.trailing, 40)
                            
                            
                        }
                    }.padding(.top, 40)
                        .padding(.bottom, 30)
                }
                
                //ROW SCORES
                VStack(spacing: 0) { // Remove spacing between rows
                    ForEach(0..<leftTimes.count, id: \.self) { index in
                        CellRow(
                            leftText: leftTimes[index],
                            centerText: days[index],
                            rightText: rightTimes[index]
                        )
                    }
                }

                Spacer()
                
            }
            .padding()
        }
    }
}           

#Preview {
    ContentView()
}
