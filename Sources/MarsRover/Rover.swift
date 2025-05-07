enum Instruction: Character {
    case left = "L", right = "R", move = "M"
}

enum Direction: String {
    case north = "N", east = "E", south = "S", west = "W"
}

class RoverState {
    var x: Int = 0
    var y: Int = 0
    var direction: Direction = .north

    init(x: Int, y: Int, direction: Direction) {
        self.x = x
        self.y = y
        self.direction = direction
    }
}

class Rover {
    private var state: RoverState

    init(_ input: String = "") {
        let s = input.split(separator: " ")
        let x = Int(s[0]) ?? 0
        let y = Int(s[1]) ?? 0
        let d = Direction(rawValue: String(s[2])) ?? .north
        self.state = RoverState(x: x, y: y, direction: d)
    }

    func go(_ commands: String) {
        let instructions = commands.compactMap { Instruction(rawValue: $0) }

        for instruction in instructions {
            switch instruction {
            case .left:
                switch state.direction {
                case .east: state.direction = .north
                case .north: state.direction = .west
                case .west: state.direction = .south
                case .south: state.direction = .east
                }
            case .right:
                switch state.direction {
                case .east: state.direction = .south
                case .south: state.direction = .west
                case .west: state.direction = .north
                case .north: state.direction = .east
                }
            case .move:
                switch state.direction {
                case .east: state.x += 1
                case .south: state.y -= 1
                case .west: state.x -= 1
                case .north: state.y += 1
                }
            }
        }
    }

    func pos() -> String {
        return "\(state.x) \(state.y) \(state.direction.rawValue)"
    }
}
