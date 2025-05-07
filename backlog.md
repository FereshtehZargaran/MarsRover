# backlog.md

## High-Level Refactoring Plan

### Step 1: Improve Readability
1. **Remove dead code**
   - Remove unused code `g(_:)`.
2. **Remove Magic Strings and Characters**
   - Replace "L", "R", "M", "N", "E", "S", "W" with enums like `Instruction` and `Direction`.
3. **Tighten Scope of Variables**
   - Make `RoverState` properties private.
   
   ---
   
   ### Step 2: Reduce Complexity
1. **Break Down Long Method**
   - The `go(_:)` method is doing too much:

2. **Remove Nested Switches**
   - Refactor direction change logic into methods or an enum.
   
   ---
   
### Step 3: Reorder Responsibilities
1. **Move Logic to Data Class (RoverState)**
   - RoverState is essentially just a container for data (xx, yy, dd) with no behavior.
     - Move Method to the class.
     - Encapsulate Field.
2. **Eliminate Feature Envy**
   - `Rover` knows too much about `RoverState` internals. Push logic into `RoverState`.

---

### Step 4: Refine Abstractions
1. **Encapsulate Primitive Data**
   - Replace `Int x`, `Int y` with with coordinate --> clear responsibilty.
2. **Replace Long Parameter List in init(_:)**
   - Refactor into a `Position` and `Direction` parameter instead of parsing a string.
3. **Remove Middle Man**
   - Let objects like `Position` or `Direction` manage their own transformations.


