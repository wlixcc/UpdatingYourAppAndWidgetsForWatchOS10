/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The bird data.
*/

import Observation
import Foundation
import SwiftData
import SwiftUI

@Model public final class Bird {
    @Attribute(.unique) public var id: UUID
    public var creationDate: Date
    
    public var species: BirdSpecies!
    public var favoriteFood: BirdFood!
    public var dislikedFoods: [BirdFood]
    public var colors: BirdPalette
    public var tag: String?
    public var lastKnownVisit: Date?
    
    /// The preferred time of day when presenting in the UI.
    public var backgroundTimeInterval: Double
    
    @Transient public var speciesName: String { species.info.name }
    @Transient public var speciesSummary: String { species.info.summary }
    
    @Transient public var visitStatus: BirdVisitStatus {
        if let lastKnownVisit {
            .recently(lastKnownVisit)
        } else {
            .never
        }
    }
    
    public init(creationDate: Date = .now, colors: BirdPalette, tag: BirdTag? = nil, backgroundTimeInterval: TimeInterval = TimeInterval(hours: 10)) {
        self.id = UUID()
        self.creationDate = creationDate
        self.colors = colors
        self.tag = tag?.rawValue
        self.backgroundTimeInterval = backgroundTimeInterval
    }
    
    public func updateVisitStatus(visitedOn date: Date) {
        guard date <= .now else { return }
        if let lastKnownVisit, lastKnownVisit > date {
            return
        }
        lastKnownVisit = date
    }
}

public enum BirdTag: String, Hashable, Codable {
    case classicGreenHummingbird
    case premiumGoldenHummingbird
}
