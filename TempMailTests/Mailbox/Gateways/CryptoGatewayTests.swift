import XCTest
@testable import TempMail

class CryptoGatewayTests: XCTestCase {

    let emptyStringMD5 = "d41d8cd98f00b204e9800998ecf8427e"
    let validEmailValue = "demo@example.com"
    let validEmailMD5 = "7c4ff521986b4ff8d29440beec01972d"
    var gateway: CryptoGateway!

    override func setUp() {
        gateway = CryptoGatewayCommonCrypto()
    }

    func testGenerateMD5FromStringWithBlankStringReturnCorrectMD5String() {
        let generatedMD5 = gateway.generateMD5FromString(value: "")

        XCTAssertEqual(emptyStringMD5, generatedMD5)
    }

    func testGenerateMD5FromStringWithValidEmailReturnCorrectMD5String() {
        let generatedMD5 = gateway.generateMD5FromString(value: validEmailValue)

        XCTAssertEqual(validEmailMD5, generatedMD5)
    }

}
