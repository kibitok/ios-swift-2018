import Foundation 

let targetDistance: Double = 100
let placeDistance1: Double = 90
let placeDistance2: Double = 0

let margin = targetDistance - placeDistance1
let margin2 = targetDistance - placeDistance2

let x = abs(margin)
let y = abs(margin2)
// margin == -0.25
// margin.magnitude == 0.25
if x > y{
    print ("the distance from home is \(y) meters")
} else if y > x {
    print ("the distance from home is \(x) meters")
} else if y == x{
    print ("the distance from home is 0 meters")
}
// Use 'abs(_:)' instead of 'magnitude'
//print("Missed the target by \(y) meters.")
// Prints "Missed the target by 0.25 meters."