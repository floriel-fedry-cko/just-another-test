import Vapor

/// A single entry of a Phone list.
struct Phone: Codable {
    /// The unique identifier for this `Phone`.
    var id: Int?
    
    /// Country Code
    var countryCode: String?
    
    /// Phone number (without country code)
    var number: String?
}
