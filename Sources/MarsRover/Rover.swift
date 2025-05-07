class RoverState {
    var x: Int = 0
    var y: Int = 0
    var direction: Character = "N"
}

class Rover {
    private var state = RoverState()

    init(_ p: String = "") {
        let s = p.split(separator: " ")
        if s.count >= 3 {
            state.x = Int(s[0]) ?? 0
            state.y = Int(s[1]) ?? 0
            state.direction = s[2].first ?? "N"
        }
    }

    func go(_ cms: String) {
        for c in cms {
            switch c {
            case "L":
                switch state.direction { case "E": state.direction = "N" case "N": state.direction = "W" case "W": state.direction = "S" case "S": state.direction = "E" default: break }
            case "R":
                switch state.direction { case "E": state.direction = "S" case "S": state.direction = "W" case "W": state.direction = "N" case "N": state.direction = "E" default: break }
            case "M":
                switch state.direction { case "E": state.x += 1 case "S": state.y -= 1 case "W": state.x -= 1 case "N": state.y += 1 default: break }
            default:
                break
            }
        }
    }

    func pos() -> String {
        return "\(state.x) \(state.y) \(state.direction)"
    }
}
