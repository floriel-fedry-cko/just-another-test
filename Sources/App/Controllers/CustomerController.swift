import Vapor

/// Controls basic CRUD operations on `Customer`s.
final class CustomerController {
    
    let endpoint = "customers/"
    
    /// Returns the list of customers
    func getAll(_ req: Request) throws -> Future<CustomerList> {
        let merchantConfig = try req.make(MerchantConfig.self)
        let client = try req.make(Client.self)
        let response = client.get("\(merchantConfig.baseUrl)\(endpoint)", headers: merchantConfig.headers).flatMap(to: CustomerList.self) { res in
            return try res.content.decode(CustomerList.self)
        }
        return response
    }
    
    /// Returns the parameterized `Customer`.
    func get(_ req: Request) throws -> Future<Response> {
        let merchantConfig = try req.make(MerchantConfig.self)
        let client = try req.make(Client.self)
        let customerId = try req.parameters.next(String.self)
        let response: Future<Response> = client.get("\(merchantConfig.baseUrl)\(endpoint)\(customerId)", headers: merchantConfig.headers)
        return response
    }
}

