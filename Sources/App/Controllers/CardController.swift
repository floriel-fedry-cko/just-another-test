import Vapor

/// Controls basic CRUD operations on `Customer`s.
final class CardController {
    
    let endpoint = "charges/token"
    
    /// Returns the response to a zero dollar authorization
    func get(_ req: Request) throws -> Future<Customer> {
        // Get Merchant Configuration
        let merchantConfig = try req.make(MerchantConfig.self)
        // Get HTTP Client instance
        let client = try req.make(Client.self)
        // Get parameter
        let customerId = try req.parameters.next(String.self)
        // Send request and get response
        let response: Future<Response> = client.get("\(merchantConfig.baseUrl)\(endpoint)\(customerId)", headers: merchantConfig.headers)
        // Transform the response
        let customer = response.flatMap(to: Customer.self) { response in
            return try response.content.decode(Customer.self)
        }
        return customer
    }
    
    func verify(_ req: Request, card: CardToken) throws -> Future<ZeroDollarResponse> {
        // Get Merchant Configuration
        let merchantConfig = try req.make(MerchantConfig.self)
        // Get HTTP Client instance
        let client = try req.make(Client.self)
        // Create the zero dollar request
        var zeroDollarRequest = ChargeRequest(cardToken: card.cardToken, currency: "USD", value: 0)
        zeroDollarRequest.customerId = card.customerId
        zeroDollarRequest.transactionIndicator = "2"
        // Send request and get response
        let response = client.post("\(merchantConfig.baseUrl)\(endpoint)", headers: merchantConfig.headers) { request in
            try request.content.encode(zeroDollarRequest)
            }.flatMap(to: ZeroDollarResponse.self) { res in
                return try res.content.decode(ZeroDollarResponse.self)
        }
        return response
        
    }
}

