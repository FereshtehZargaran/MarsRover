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

    func rotateLeft() {
        switch direction {
        case .east: direction = .north
        case .north: direction = .west
        case .west: direction = .south
        case .south: direction = .east
        }
    }

    func rotateRight() {
        switch direction {
        case .east: direction = .south
        case .south: direction = .west
        case .west: direction = .north
        case .north: direction = .east
        }
    }

    func moveForward() {
        switch direction {
        case .east: x += 1
        case .south: y -= 1
        case .west: x -= 1
        case .north: y += 1
        }
    }

    func formatted() -> String {
        return "\(x) \(y) \(direction.rawValue)"
    }
}

class Rover {
    private var state: RoverState

    init(_ input: String = "") {
        let s = input.split(separator: " ")
        let x = Int(s[0]) ?? 0
        let y = Int(s[1]) ?? 0
        let d = Direction(rawValue: String(s[2])) ?? .north
        state = RoverState(x: x, y: y, direction: d)
    }

    func go(_ commands: String) {
        let instructions = commands.compactMap { Instruction(rawValue: $0) }

        for instruction in instructions {
            switch instruction {
            case .left:
                state.rotateLeft()
            case .right:
                state.rotateRight()
            case .move:
                state.moveForward()
            }
        }
    }

    func pos() -> String {
        return state.formatted()
    }
}
