//
//  ContentView.swift
//  BirthdayApp
//
//  Created by Scholar on 7/25/25.
//

import SwiftUI

struct ContentView: View {
    @State private var friends: [Friend] = [
        Friend (name: "Poorna", birthday: .now),
        Friend (name: "Sundus", birthday: .now)
    ]
    @State private var newName = ""
    @State private var newBirthday = Date.now
    
    var body: some View {
        NavigationStack {
            List(friends, id: \.name) { friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
                
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack (alignment: .center, spacing: 20){
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, dislayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newBirthday)
                        friends.append(newFriend)
                        newName = ""
                        newBirthday = .now
                    }
                    .bold()
                }
            }
        }
    }
}
        #Preview {
            ContentView()
        }
