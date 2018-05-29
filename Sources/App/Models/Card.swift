import Vapor

/// A single entry of a Customer list.
struct Card: Content {
    /// The unique identifier for this `Card`.
    var id: String?
    
    /// Customer Id
    var customerId: String
    
    /// Expiry month
    var expiryMonth: String
    
    /// Expiry year
    var expiryYear: String
    
    /// Billing address
    var billingDetails: Address
    
    /// Last 4 digits of the card number
    var last4: String
    
    /// Bin of the card number (first 6 digits)
    var bin: String
    
    /// Payment method used (e.g. Visa)
    var paymentMethod: String
    
    /// Card fingerprint
    var fingerprint: String
    
    /// Name of the card owner
    var name: String?
    
    /// True if it is the default card
    var defaultCard: Bool?
}
