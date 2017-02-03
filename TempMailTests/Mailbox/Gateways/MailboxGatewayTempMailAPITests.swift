import XCTest
@testable import TempMail

class MailboxGatewayTempMailAPITests: XCTestCase {

    var gateway: MailboxGatewayTempMailAPI!

    override func setUp() {
        gateway = MailboxGatewayTempMailAPI()
    }

    func testGetDomainFromDomainsOfTempMailAPI() {
        let longRunningExpectation = expectation(description: "longRunningFunction")
        var domainName = ""

        gateway.getDomain { result in
            switch result {
            case let .success(domain): domainName = domain.name
            case .failure(_): XCTFail("Should be success request")
            }
            longRunningExpectation.fulfill()
        }

        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error)
            XCTAssertFalse(domainName.isEmpty)
            guard let firstChar = domainName.characters.first else {
                XCTFail("Empty string")
                return
            }
            XCTAssertEqual(firstChar, Character("@"))
        }
    }
}
