//
//  AppView.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 9/5/20.
//

import SwiftUI

struct AppView: View {
    
    @State var itemIDQueryString: String = ""
    @State var itemNameQueryString: String = ""
    @Binding var user: User?
    @State var sheet: DisplaySheet = .none
    @State var itemDetailed: InventoryItem? = nil
    @State var pickerSelection = "number"
    
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
                            self.sheet = .barcode
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
                            self.sheet = .settings
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
                 
                Text("Search by:")
                Picker("", selection: $pickerSelection) {
                    Text("Item #").tag("number")
                    Text("Name").tag("name")
                    Text("Location").tag("location")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                VStack {
                    if self.pickerSelection == "number" {
                        Spacer()
                        NumberPadView(typed: self.$itemIDQueryString, sheet: self.$sheet)
                            .padding(.bottom,100)
                            .sheet(isPresented: Binding<Bool>(get: { self.sheet != .none }, set: { if !$0 { self.sheet = .none } })) {
                            if self.sheet == .results {
                                SearchResults(itemIDQueryString: self.$itemIDQueryString, itemNameQueryString: self.$itemNameQueryString)
                            }
                            if self.sheet == .barcode {
                                BarcodeScanner(sheet: self.$sheet, resultString:self.$itemIDQueryString)
                            }
                            if self.sheet == .settings {
                                SettingsView()
                            }
                        }
                    }
                    else if pickerSelection == "name" {
                        VStack {
                            SMTextField("Item Name", text: self.$itemNameQueryString)
                                .frame(maxHeight: 40)
                                .padding(.horizontal)
                            TextButton("Search", textColor: .white, grad: .black) {
                                self.sheet = .results
                            }
                        }.padding(.vertical)
                        Spacer()
                    }
                    
                    else if pickerSelection == "location" {
                        
                    }
                }
                
            }.padding(.top)
            
        }
        
        
            
        
    }

}

enum DisplaySheet {
    case none, results, detail, barcode, settings
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(itemIDQueryString: "1234", user: Binding<User?>(get: {
            return User(userID: "userID", firstName: "firstName", lastName: "lastName", email: "user@example.org", storeID: "Test Store 1", companyID: "Test Com", lastLoginDate: 15692922092, ipAddresses: [], userRole: .user)
        }, set: {let _ = $0}))
    }
}
