import Foundation

struct RandomUsersGatewayPlist: RandomUsersGateway {

    func generateUsername() -> String {
        let names = pickFirstNameAndLastName()
        return "\(names.first).\(names.last)"
    }

    private func pickFirstNameAndLastName() -> (first: String, last: String) {
        var firstAndLastName = (first: "default", last: "default")

        let firstNameRandomIndex = Int(arc4random_uniform(UInt32(firstNames.count)))
        firstAndLastName.first = firstNames[firstNameRandomIndex].lowercased()
        let lastNameRandomIndex = Int(arc4random_uniform(UInt32(lastNames.count)))
        firstAndLastName.last = lastNames[lastNameRandomIndex].lowercased()

        return firstAndLastName
    }

}
