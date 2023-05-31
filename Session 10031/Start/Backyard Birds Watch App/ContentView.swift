/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A main view of the app.
*/

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var backyardsData: BackyardsData
    @State var selectedBackyard: Backyard? = nil
    
    var body: some View {
        NavigationStack {
            List(backyardsData.backyards) { backyard in
                BackyardCell(backyard: backyard)
            }
            .listStyle(.carousel)
            .navigationTitle("Backyards")
            .navigationDestination(for: Backyard.self) { backyard in
                BackyardView(backyard: backyard)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selectedBackyard: BackyardsData().backyards.first)
            .environmentObject(BackyardsData())
    }
}
