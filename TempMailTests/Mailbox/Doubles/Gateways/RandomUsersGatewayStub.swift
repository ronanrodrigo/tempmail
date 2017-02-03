@testable import TempMail

class RandomUsersGatewayStub: RandomUsersGateway {

    var username = ""

    func generateUsername() -> String {
        return username
    }

}
