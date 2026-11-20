namespace Church

universe u

def CNat : Type (u + 1) :=
  ∀ {α : Type u}, (α → α) → α → α

namespace CNat

def zero : CNat :=
  fun _ z => z

def succ (n : CNat) : CNat :=
  fun f z => f (n f z)

def add (m n : CNat) : CNat :=
  fun f z => m f (n f z)

def add' (m : CNat.{u}) (n : CNat.{u}) : CNat.{u} :=
  n (succ m)

def mul (m n : CNat) : CNat :=
  fun f => m (n f)

def mul' (m : CNat.{u}) (n : CNat.{u + 1}) : CNat.{u} :=
  n (add m) zero

def exp (m : CNat.{u}) (n : CNat.{u + 1}) : CNat.{u} :=
  n (mul m) (succ zero)

def church (n : Nat) : CNat :=
  match n with
  | 0 => zero
  | n + 1 => succ (church n)

def unchurch (n : CNat.{0}) : Nat :=
  n (· + 1) 0

end CNat

end Church
