/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The plant data.
*/

import Observation
import SwiftData
import OSLog

private let logger = Logger(subsystem: "Backyard Birds Data", category: "Plant")

@Model public final class Plant {
    @Attribute(.unique) public var id: UUID
    public var creationDate: Date
    public var species: PlantSpecies?
    public var backyard: Backyard?
    public var variant: Int
    
    @Transient public var speciesName: String { species?.info.name ?? "" }
    @Transient public var speciesSummary: String { species?.info.summary ?? "" }
    
    public init(id: UUID = UUID(), variant: Int) {
        self.id = id
        self.creationDate = .now
        self.variant = variant
    }
}
