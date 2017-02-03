import XCTest
@testable import TempMail

class RandomUsersGatewayPlistTests: XCTestCase {

    var gateway: RandomUsersGatewayPlist!

    override func setUp() {
        super.setUp()
        gateway = RandomUsersGatewayPlist()
    }

    func testGenerateUsernameWithData() {
        let randomGeneratedUsername = gateway.generateUsername()

        XCTAssertTrue(randomGeneratedUsername.characters.count > 1)
        XCTAssertNotEqual(randomGeneratedUsername, "default.default")
    }
}
