import SwiftUI


struct GridPoint{
    var x:CGFloat
    var y:CGFloat
}

extension GridPoint:Hashable{
    static func == (lhs: GridPoint, rhs: GridPoint)->Bool{
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}

var tappedPoints:Set = [GridPoint(x: 1, y: 2),GridPoint(x: 4, y: 5)]

let nextTap = GridPoint(x: 2, y: 4)
if tappedPoints.contains(nextTap)
{
    print("exist")
}else
{
    print("not exist")
}
