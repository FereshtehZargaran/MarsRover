class RoverState {
    var x: Int = 0
    var y: Int = 0
    var direction: Character = "N"
}

class Rover {
    private var rs = RoverState()

    init(_ p: String = "") {
        let s = p.split(separator: " ")
        if s.count >= 3 {
            rs.x = Int(s[0]) ?? 0
            rs.y = Int(s[1]) ?? 0
            rs.direction = s[2].first ?? "N"
        }
    }

    func go(_ cms: String) {
        for c in cms {
            switch c {
            case "L":
                switch rs.direction { case "E": rs.direction = "N" case "N": rs.direction = "W" case "W": rs.direction = "S" case "S": rs.direction = "E" default: break }
            case "R":
                switch rs.direction { case "E": rs.direction = "S" case "S": rs.direction = "W" case "W": rs.direction = "N" case "N": rs.direction = "E" default: break }
            case "M":
                switch rs.direction { case "E": rs.x += 1 case "S": rs.y -= 1 case "W": rs.x -= 1 case "N": rs.y += 1 default: break }
            default:
                break
            }
        }
    }

    func pos() -> String {
        return "\(rs.x) \(rs.y) \(rs.direction)"
    }
}
