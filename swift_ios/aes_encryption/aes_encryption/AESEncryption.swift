//
//  AESEncryption.swift
//  aes_encryption
//
//  Created by T942488 on 30/10/2020.
//

import Foundation
import CryptoSwift

class CryptoHelper{
    
    let key : String
    let iv : String

    init(key: String, iv: String) {
        self.key = key
        self.iv = iv
    }

    public func encrypt(input:String)->String?{
        do{
            let encrypted: Array<UInt8> = try AES(key: self.key, iv: self.iv, padding: .pkcs7).encrypt(Array(input.utf8))

            return encrypted.toBase64()
        }catch{

        }
        return nil
    }

    public func decrypt(input:String)->String?{
        do{
            let d=Data(base64Encoded: input)
            let decrypted = try AES(key: self.key, iv: self.iv, padding: .pkcs7).decrypt(
                d!.bytes)
            return String(data: Data(decrypted), encoding: .utf8)
        }catch{

        }
        return nil
    }
}
