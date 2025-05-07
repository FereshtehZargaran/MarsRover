enum Instruction: Character {
    case left  = "L", right = "R", move  = "M"
}

class RoverState {
    var x: Int = 0
    var y: Int = 0
    var direction: Character = "N"
}

class Rover {
    private var state = RoverState()

    init(_ input: String = "") {
        let s = input.split(separator: " ")
        if s.count >= 3 {
            state.x = Int(s[0]) ?? 0
            state.y = Int(s[1]) ?? 0
            state.direction = s[2].first ?? "N"
        }
    }

    func go(_ commands: String) {
        let instructions = commands.compactMap { Instruction(rawValue: $0) }

        for instruction in instructions {
            switch instruction {
            case .left:
                switch state.direction {
                case "E": state.direction = "N"
                case "N": state.direction = "W"
                case "W": state.direction = "S"
                case "S": state.direction = "E"
                default: break
                }
            case .right:
                switch state.direction {
                case "E": state.direction = "S"
                case "S": state.direction = "W"
                case "W": state.direction = "N"
                case "N": state.direction = "E"
                default: break
                }
            case .move:
                switch state.direction {
                case "E": state.x += 1
                case "S": state.y -= 1
                case "W": state.x -= 1
                case "N": state.y += 1
                default: break
                }
            }
        }
    }

    func pos() -> String {
        return "\(state.x) \(state.y) \(state.direction)"
    }
}
