struct CryptoGatewayCommonCrypto: CryptoGateway {

    func generateMD5FromString(value: String) -> String {
        let context = UnsafeMutablePointer<CC_MD5_CTX>.allocate(capacity: 1)
        var digest = [UInt8](repeating:0, count:Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5_Init(context)
        CC_MD5_Update(context, value, CC_LONG(value.lengthOfBytes(using: String.Encoding.utf8)))
        CC_MD5_Final(&digest, context)
        context.deallocate(capacity: 1)
        return digest.reduce("") { (result, item) in
            return result + String(format: "%02x", item)
        }
    }

}
