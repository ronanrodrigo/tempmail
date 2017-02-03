import XCTest
@testable import TempMail

class RandomUsersGatewayMemoryTests: XCTestCase {

    var gateway: RandomUsersGatewayMemory!

    override func setUp() {
        super.setUp()
        gateway = RandomUsersGatewayMemory()
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
