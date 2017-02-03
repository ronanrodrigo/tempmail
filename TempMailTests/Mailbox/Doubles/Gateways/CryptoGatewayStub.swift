@testable import TempMail

class CryptoGatewayStub: CryptoGateway {

    var md5Value = ""

    func generateMD5FromString(value: String) -> String {
        return md5Value
    }

}
