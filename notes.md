# notes.md

## Pomodoro Flow

### Pomodoro 1:
    - [x] Remove unused code `g(_:)`.
    - [x] Rename method, variables.
    - [x] Fix code indentation.
    - [x] Replace magic strings ("L", "R", "M", "N", "E", "S", "W") with enums `Instruction` and `Direction`.
    - [x] Make RoverState properties private to enforce encapsulation.
      **Use Mikado method**
            - [x] Change `init(_:)`- init Rover state.
            
### Pomodoro 2: 
    - [x] Make RoverState properties private to enforce encapsulation.
      **Use Mikado method**            
        - [x] Change `go(_:)`- move logic to Rover state.
        - [x] Change `pos(_:)`- move logic to Rover state.
        
### Pomodoro 3: 
    - [x] Split the `go(_:)` method into smaller, clearer methods
    - [x] Refactor `init(_:)`
    
### Pomodoro 4: 
    - [x] Move x and y to a separate object.
        - [x] Move `moveForward()` from RoverState to Position.
        - [x] RoverState -> `formatted()`
        - [x] Rover -> `init(_:)`
     

    

