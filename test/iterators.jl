using Base.Iterators

import Base: OneTo
import Base.Iterators: drop, take

@test take(OneTo(10), 8) == OneTo(8)
@test take(OneTo(10), 11) == OneTo(10)
@test take(UnitRange(-1, 3), 8) == UnitRange(-1, 3)
@test take(UnitRange(-1, 3), 3) == UnitRange(-1, 1)
@test take(StepRange(1, -3, -5), 2) == StepRange(1, -3, -2)
@test take(StepRange(1, -3, -5), 5) == StepRange(1, -3, -5)

@test drop(OneTo(10), 2) == UnitRange(3, 10)
@test drop(OneTo(10), 10) == UnitRange(10, 9)
@test drop(UnitRange(-1, 10), 10) == UnitRange(9, 10)
@test drop(UnitRange(-1, 10), 12) == UnitRange(10, 9)
@test drop(StepRange(1, -2, -10), 2) == StepRange(-3, -2, -10)
@test drop(StepRange(1, -2, -10), 6) == StepRange(1, -2, 2)
