namespace Church

universe u

def CBool : Type (u + 1) :=
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
  fun a b => p (q b a) (q a b)

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

end Church

/-
  Some sanity checks
-/

open Church.CBool

-- Or
example :
  (unchurch (or true true)   == Bool.true) &&
  (unchurch (or true false)  == Bool.true) &&
  (unchurch (or false true)  == Bool.true) &&
  (unchurch (or false false) == Bool.false) = Bool.true
:= rfl

-- And
example :
  (unchurch (and true true)   == Bool.true)  &&
  (unchurch (and true false)  == Bool.false) &&
  (unchurch (and false true)  == Bool.false) &&
  (unchurch (and false false) == Bool.false) = Bool.true
:= rfl

-- Not
example :
  (unchurch (not true) == Bool.false) &&
  (unchurch (not false) == Bool.true) = Bool.true
:= rfl

-- Xor
example :
  (unchurch (xor true true)   == Bool.false) &&
  (unchurch (xor true false)  == Bool.true)  &&
  (unchurch (xor false true)  == Bool.true)  &&
  (unchurch (xor false false) == Bool.false) = Bool.true
:= rfl

-- Nand
example :
  (unchurch (nand true true)   == Bool.false) &&
  (unchurch (nand true false)  == Bool.true)  &&
  (unchurch (nand false true)  == Bool.true)  &&
  (unchurch (nand false false) == Bool.true) = Bool.true
:= rfl

-- Implies
example :
  (unchurch (implies true true)   == Bool.true) &&
  (unchurch (implies true false)  == Bool.false)  &&
  (unchurch (implies false true)  == Bool.true)  &&
  (unchurch (implies false false) == Bool.true) = Bool.true
:= rfl
