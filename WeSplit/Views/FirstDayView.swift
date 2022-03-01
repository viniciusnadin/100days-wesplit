//
//  FirstDayView.swift
//  WeSplit
//
//  Created by Vinicius Nadin on 28/02/22.
//

import SwiftUI

struct FirstDayView: View {
    
    // Program @state is to use variables inside structs, because in structs we never mutate the parameters
    @State private var tapCount = 0
    @State private var name = ""
    @State private var selectedStudent = "Harry"
    private let students = ["Harry", "Hermione", "Ron"]
    
    var body: some View {
        // NAVIGATION VIEW
        NavigationView {
            // FORM
            VStack {
                Form {
                    // IN SWIFTUI WE HAVE THE MAX OF 10 ITENS IN A ROW
                    // TO PUT MORE ITENS, JUST ADD IN A 'GROUP'
                    // GROUP DOESN'T DO ANYTHING IN VIEW, JUST TO GROUP MORE THAN 10 ITENS
                    Group {
                        // SECTION IS A VISUAL COMPONENT TO SEPARETE THINGS IN THE FORM
                        Section {
                            // $ IS TO MAKE 2 WAY BINDING, TO WRITE IN NAME VARIABLE
                            TextField("Enter your name: ", text: self.$name).padding()
                            Text("Your name is: \(self.name)").padding()
                        }
                        
                        Section {
                            // Button Element
                            Button("Taps: \(self.tapCount)") {
                                self.tapCount += 1
                            }
                        }
                        
                        Section {
                            Picker("Select your student", selection: self.$selectedStudent) {
                                // \.self tells to swift that string are the 'id', that defines that id is unique
                                ForEach(self.students, id: \.self) {
                                    Text($0)
                                }
                            }
                        }
                    }
                    // WE SET A TITLE TO OUR VIEW
                }.navigationTitle("Title").navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct FirstDayView_Previews: PreviewProvider {
    static var previews: some View {
        FirstDayView()
    }
}
