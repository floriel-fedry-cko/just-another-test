import Vapor

/// A single entry of a Address list.
struct Address: Codable {
    /// The unique identifier for this `Address`.
    var id: Int?
    
    /// Line 1
    var addressLine1: String?
    
    /// Line 2
    var addressLine2: String?
    
    /// Postcode
    var postcode: String?
    
    /// Country
    var country: String?
    
    /// City
    var city: String?
    
    /// State
    var state: String?
    
    /// Phone
    var phone: Phone?
}
