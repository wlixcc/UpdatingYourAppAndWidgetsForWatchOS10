/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A convenience extension to create floor images.
*/

import SwiftUI

public extension Image {
    static let floor = Image("Floor 1", bundle: .module).resizable()
}
