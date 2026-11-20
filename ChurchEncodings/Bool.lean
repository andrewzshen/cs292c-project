namespace Church

def CBool.{u} : Type (u + 1) :=
  ∀ {α : Type u}, α → α → α

namespace CBool

def true : CBool :=
  fun a _ => a

def false : CBool :=
  fun _ b => b

def and (p q : CBool) : CBool :=
  fun a b => p (q a b) b

def or (p q : CBool) : CBool :=
  fun a b => p a (q a b)

def not (p : CBool) : CBool :=
  fun a b => p b a

def xor (p q : CBool) : CBool :=
  fun a b => p (p b a) (q a b)

def nand (p q : CBool) : CBool :=
  fun a b => p (q b a) a

def implies (p q : CBool) : CBool :=
  fun a b => p (q a b) a

-- def ite {α : Type u} (p : CBool.{u}) (a b : α) : α :=
--   p a b

def church (b : Bool) : CBool :=
  if b then CBool.true else CBool.false

def unchurch (b : CBool) : Bool :=
  b Bool.true Bool.false

end CBool

/-
  Some sanity checks
-/

-- Or
#eval CBool.unchurch (CBool.or CBool.true CBool.true)
#eval CBool.unchurch (CBool.or CBool.true CBool.false)
#eval CBool.unchurch (CBool.or CBool.false CBool.true)
#eval CBool.unchurch (CBool.or CBool.false CBool.false)

-- And
#eval CBool.unchurch (CBool.and CBool.true CBool.true)
#eval CBool.unchurch (CBool.and CBool.true CBool.false)
#eval CBool.unchurch (CBool.and CBool.false CBool.true)
#eval CBool.unchurch (CBool.and CBool.false CBool.false)

-- Not
#eval CBool.unchurch (CBool.not CBool.true)
#eval CBool.unchurch (CBool.not CBool.false)

-- Xor
#eval CBool.unchurch (CBool.xor CBool.true CBool.true)
#eval CBool.unchurch (CBool.xor CBool.true CBool.false)
#eval CBool.unchurch (CBool.xor CBool.false CBool.true)
#eval CBool.unchurch (CBool.xor CBool.false CBool.false)

-- Nand
#eval CBool.unchurch (CBool.nand CBool.true CBool.true)
#eval CBool.unchurch (CBool.nand CBool.true CBool.false)
#eval CBool.unchurch (CBool.nand CBool.false CBool.true)
#eval CBool.unchurch (CBool.nand CBool.false CBool.false)

-- Implies
#eval CBool.unchurch (CBool.implies CBool.true CBool.true)
#eval CBool.unchurch (CBool.implies CBool.true CBool.false)
#eval CBool.unchurch (CBool.implies CBool.false CBool.true)
#eval CBool.unchurch (CBool.implies CBool.false CBool.false)

end Church
