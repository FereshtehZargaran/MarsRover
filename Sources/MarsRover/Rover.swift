enum Instruction: Character {
    case left = "L", right = "R", move = "M"
}

enum Direction: String {
    case north = "N", east = "E", south = "S", west = "W"
}

class RoverState {
    private var x: Int
    private var y: Int
    private var direction: Direction

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
    private enum RoverError: Error {
        case invalidInput
    }

    private var state: RoverState

    init(_ input: String) {
        let splicedState = input.split(separator: " ")

        guard splicedState.count >= 3,
              let x = Int(splicedState[0]),
              let y = Int(splicedState[1]),
              let direction = Direction(rawValue: String(splicedState[2]))
        else {
            state = RoverState(x: 0, y: 0, direction: .north)
            return
        }

        state = RoverState(x: x, y: y, direction: direction)
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

private extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
