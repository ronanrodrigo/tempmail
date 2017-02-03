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

        let firstName = randomGeneratedUsername.components(separatedBy: ".").first!
        XCTAssertTrue(firstNames.contains(firstName))
        let lastName = randomGeneratedUsername.components(separatedBy: ".").last!
        XCTAssertTrue(lastNames.contains(lastName))
        XCTAssertNotEqual(randomGeneratedUsername, "default.default")
    }
}
