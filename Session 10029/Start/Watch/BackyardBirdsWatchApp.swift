/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The entry point for the watchOS app.
*/

import SwiftUI
import SwiftData
import BackyardBirdsData

@main
struct BackyardBirdsWatchApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .backyardBirdsDataContainer()
        }
    }
}
