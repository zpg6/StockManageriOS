//
//  CreateAccount.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 9/5/20.
//

import SwiftUI

struct CreateAccount: View {
    
    @Binding var user: User?
    @State var invitationCode = "FirstCode"
    @State var email = "zpg6@pitt.edu"
    @State var password = "Test1234"
    @State var confirmPassword = "Test1234"
    @State var firstName = "Zach"
    @State var lastName = "Grimaldi"
    @State var result = ""
    @State var loading = false
    
    let grad = Gradient(colors: [.blue,Color(.systemIndigo)])
    
    var body: some View {
        VStack {
            Text("Create Account").font(.largeTitle).bold().padding(30)
            
            SMTextField("Invitation Code", text: self.$invitationCode)
            SMTextField("First Name", text: self.$firstName)
            SMTextField("Last Name", text: self.$lastName)
            SMTextField("Email", text: self.$email)
            SMSecureField("Password", text: self.$password)
            SMSecureField("Confirm Password", text: self.$confirmPassword)
            
            TextButton("Create Account", textColor: .white, grad: grad) {
                if !self.loading {
                    self.loading = true
                    API.createUser(invitationCode: self.invitationCode, firstName: self.firstName, lastName: self.lastName, email: self.email, password: self.password)
                }
            }
            
            VStack {
                if self.loading {
                    Text("Creating...")
                }
                if self.result != "" {
                    Text(self.result)
                }
            }
            
            Spacer()
            
        }.padding(50).padding(.bottom,50)
        .onAppear {
            NotificationCenter.default.addObserver(forName: NSNotification.Name.createAccountResult, object: nil, queue: .main) { (_) in
                self.user = API.main.user
                self.result = API.main.createAccountError
                self.loading = false
            }
        }
    }
}
