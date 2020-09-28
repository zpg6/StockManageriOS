//
//  AppView.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 9/5/20.
//

import SwiftUI

struct AppView: View {
    
    @State var itemIDQueryString: String = ""
    @State var showQueryResults: Bool = false
    @Binding var user: User?
    @State var sheet: DisplaySheet = .results
    @State var itemDetailed: InventoryItem? = nil
    
    var companyName : String {
        if let user = self.user {
            return "\(user.companyID)"
        } else {
            return ""
        }
    }
    
    var storeID : String {
        if let user = self.user {
            return "Store: \(user.storeID)"
        } else {
            return ""
        }
    }
    
    var firstNameWelcome : String {
        if let user = self.user {
            return "Welcome, \(user.firstName)!"
        } else {
            return ""
        }
    }
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient.SM, startPoint: .topTrailing, endPoint: .bottomLeading).edgesIgnoringSafeArea(.all)
            
            VStack {
                if self.companyName != "" {
                    HStack {
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "qrcode")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 25, height: 25)
                        }
                        
                        Spacer()
                        
                        Text(self.companyName)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "gear")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 25, height: 25)
                        }
                        
                        
                    }.padding(.top,20)
                    .padding(.horizontal,30)
                }
                if self.storeID != "" {
                    Text(self.storeID)
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.bottom,20)
                }
                if self.firstNameWelcome != "" {
                    Text(self.firstNameWelcome).italic()
                }
                Spacer()
                NumberPadView(typed: self.$itemIDQueryString, showResults: self.$showQueryResults)
                    .padding(.bottom,100)
                .sheet(isPresented: self.$showQueryResults) {
                    SearchResults(searchString: self.itemIDQueryString)
                        .onDisappear {
                            self.itemIDQueryString = ""
                        }
                }
            }
        }
        
        
            
        
    }
}

enum DisplaySheet {
    case results, detail
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(itemIDQueryString: "1234", user: Binding<User?>(get: {
            return User(userID: "userID", firstName: "firstName", lastName: "lastName", email: "user@example.org", storeID: "Test Store 1", companyID: "Test Com", lastLoginDate: 15692922092, ipAddresses: [], userRole: .user)
        }, set: {let _ = $0}))
    }
}
