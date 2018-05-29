import Vapor

public final class MerchantConfig: ServiceType {

    public var baseUrl = "https://sandbox.checkout.com/api2/v2/"
    public var headers: HTTPHeaders = [
        "Authorization": Environment.get("SECRET_KEY") ?? "",
        "Content-Type": "application/json"
    ]
    
    public static func makeService(for worker: Container) throws -> MerchantConfig {
        return MerchantConfig()
    }
    
    public init() {}
    
}
