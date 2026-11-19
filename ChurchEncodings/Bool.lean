namespace Church

def CBool.{u} : Type (u + 1) :=
  ∀ (α : Type u), α → α → α

def true : CBool := sorry
