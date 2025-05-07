enum Instruction: Character {
    case left = "L", right = "R", move = "M"
}

enum Direction: String {
    case north = "N", east = "E", south = "S", west = "W"
}

struct Position {
    var x: Int
    var y: Int

    mutating func move(in direction: Direction) {
        switch direction {
        case .east: x += 1
        case .south: y -= 1
        case .west: x -= 1
        case .north: y += 1
        }
    }

}

class RoverState {
    private var position: Position
    private var direction: Direction

    init(position: Position, direction: Direction) {
        self.position = position
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
        position.move(in: direction)
    }

    func formatted() -> String {
        return "\(position.x) \(position.y) \(direction.rawValue)"
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
            // default state
            state = RoverState(position: Position(x: 0, y: 0), direction: .north)
            return
        }

        let position = Position(x: x, y: y)
        state = RoverState(position: position, direction: direction)
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
