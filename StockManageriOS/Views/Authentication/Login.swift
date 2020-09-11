//
//  Login.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 9/5/20.
//

import SwiftUI

struct Login: View {
    
    @Binding var user: User?
    @State var email = "zpg6@pitt.edu"
    @State var password = "Test1234"
    @State var result = ""
    @State var loading = false
    @State var showSheet = false
    
    let grad = Gradient(colors: [.blue,Color(.systemIndigo)])
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("StockManagerLogoV1")
                .resizable()
                .frame(width: 100, height: 100)
            
            Text("Login").font(.largeTitle).bold().padding(30)
            
            VStack {
                SMTextField("Email", text: self.$email)
                SMSecureField("Password", text: self.$password)
            }
            
            TextButton("Login", textColor: .white, grad: grad) {
                if !self.loading {
                    self.loading = true
                    API.authenticate(email: self.email, password: self.password)
                }
            }
            
            VStack {
                Text("or").padding()
                
                Button(action: {
                    self.showSheet.toggle()
                }) {
                    Text("Create an Account").font(.headline).bold().foregroundColor(.primary)
                }.sheet(isPresented: self.$showSheet) {
                    CreateAccount(user: self.$user)
                }
                
                VStack {
                    if self.loading {
                        Text("Authenticating...").bold()
                    }
                    if self.result != "" {
                        Text(self.result)
                    }
                }
            }
            
            Spacer()
            
        }.padding(50).padding(.vertical,(UIScreen.main.bounds.width / CGFloat(414))*CGFloat(150))
        .onAppear {
            NotificationCenter.default.addObserver(forName: NSNotification.Name.authenticationResult, object: nil, queue: .main) { (_) in
                self.user = API.main.user
                self.result = API.main.authenticationError
                self.loading = false
            }
        }
    }
}
