//
//  ContentView.swift
//  aes_encryption
//
//  Created by T942488 on 29/10/2020.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State var text: String = "";
    @ObservedObject var key = TextLimiter(limit: 16);
    @ObservedObject var iv = TextLimiter(limit: 16);
    @State var output = "";
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack.init(alignment: .leading) {
                Text("Text to encrypt")
                TextField("Text to encrypt...", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            VStack.init(alignment: .leading) {
                Text("Key")
                TextField("abc#$%...", text: $key.value)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(Color.red,
                                width: $key.hasReachedLimit.wrappedValue ? 1 : 0 )
                Text("Must be 16 char").foregroundColor(.gray).font(.system(size: 10))
            }
            VStack.init(alignment: .leading) {
                Text("IV")
                TextField("abc#$%...", text: $iv.value)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(Color.red,
                                width: $iv.hasReachedLimit.wrappedValue ? 1 : 0 )
                Text("Must be 16 char").foregroundColor(.gray).font(.system(size: 10))
            }
            Divider().padding(.vertical)
            Text("Output").font(.system(size: 14))
            Text(output)
            Spacer()
            Button(action: {
                let encrypter = CryptoHelper(key: key.value, iv: iv.value)
                self.output = encrypter.encrypt(input: text) ?? "Unable to Process"
            }, label: {
                HStack {
                    Spacer()
                    Text("Process")
                    Spacer()
                }
            }).padding()
            .foregroundColor(.white)
            .background($key.hasReachedLimit.wrappedValue || $iv.hasReachedLimit.wrappedValue ? Color.gray : Color.purple)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .disabled($key.hasReachedLimit.wrappedValue || $iv.hasReachedLimit.wrappedValue)
        }.padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
