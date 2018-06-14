import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    // Customer controller
    let customerController = CustomerController()
    router.get("customers", use: customerController.getAll)
    router.get("customers", String.parameter, use: customerController.get)
    
    // Card controller
    let cardController = CardController()
    router.post(CardToken.self, at: "cards/verify", use: cardController.verify)
    router.post(AuthorizeWithCardIdRequest.self, at: "cards/pay3d", use: cardController.authorizeWith3ds)
    router.post(ChargeRequest.self, at: "cards/charge", use: cardController.charge)
    
}
