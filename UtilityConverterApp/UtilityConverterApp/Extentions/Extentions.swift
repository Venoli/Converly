
/*
 Copyright © 2019 Apple Inc.
Changed by Venoli Gamage on 2021-03-09.
Abstract:
Functions for helping display the user interface.
*/

import UIKit

extension CGRect {
    func dividedIntegral(fraction: CGFloat, from fromEdge: CGRectEdge) -> (first: CGRect, second: CGRect) {
        let dimension: CGFloat
        
        switch fromEdge {
        case .minXEdge, .maxXEdge:
            dimension = self.size.width
        case .minYEdge, .maxYEdge:
            dimension = self.size.height
        }
        
        let distance = (dimension * fraction).rounded(.up)
        var slices = self.divided(atDistance: distance, from: fromEdge)
        
        switch fromEdge {
        case .minXEdge, .maxXEdge:
            slices.remainder.origin.x += 15
            slices.remainder.size.width -= 15
        case .minYEdge, .maxYEdge:
            slices.remainder.origin.y += 15
            slices.remainder.size.height -= 15
        }
        
        return (first: slices.slice, second: slices.remainder)
    }
}


