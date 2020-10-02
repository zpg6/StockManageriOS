//
//  BarcodeScanner.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 10/1/20.
//

import SwiftUI
import CarBode

struct BarcodeScanner: View {
    
    @Binding var sheet: DisplaySheet
    @Binding var resultString: String
    @State var torchIsOn = false
    
    var body: some View {
        ZStack (alignment: .topLeading) {
            CBScanner(supportBarcode: .constant([.qr]), torchLightIsOn: self.$torchIsOn, scanInterval: .constant(0.25)) {
                let stringFound = $0
                print(stringFound)
                self.resultString = stringFound.value
                Vibration.success.vibrate()
                DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
                    self.sheet = .results
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            Button(action: {
                self.torchIsOn.toggle()
            }) {
                Image(systemName: self.torchIsOn ? "bolt.slash.fill":"bolt.fill")
                .resizable()
                .frame(width: self.torchIsOn ? 25:21, height: 31)
                .foregroundColor(.orange)
                .padding(.horizontal, self.torchIsOn ? 0:2)
                .padding()
            }.background(Color(.systemBackground).opacity(0.5))
                .cornerRadius(5).padding([.top,.leading],20)
        }
    }
}


enum Vibration {
        case none
       case error
       case success
       case warning
       case light
       case medium
       case heavy
       @available(iOS 13.0, *)
       case soft
       @available(iOS 13.0, *)
       case rigid
       case selection
       case oldSchool

       public func vibrate() {
           switch self {
           case .error:
               UINotificationFeedbackGenerator().notificationOccurred(.error)
           case .success:
               UINotificationFeedbackGenerator().notificationOccurred(.success)
           case .warning:
               UINotificationFeedbackGenerator().notificationOccurred(.warning)
           case .light:
               UIImpactFeedbackGenerator(style: .light).impactOccurred()
           case .medium:
               UIImpactFeedbackGenerator(style: .medium).impactOccurred()
           case .heavy:
               UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
           case .soft:
               if #available(iOS 13.0, *) {
                   UIImpactFeedbackGenerator(style: .soft).impactOccurred()
               }
           case .rigid:
               if #available(iOS 13.0, *) {
                   UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
               }
           case .selection:
               UISelectionFeedbackGenerator().selectionChanged()
            default:
                break
           }
       }
   }
