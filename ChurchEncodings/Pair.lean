namespace Church

universe u

def CPair (α β : Type u) : Type (u + 1) :=
  ∀ {γ : Type u}, (α → β → γ) → γ

namespace CPair

def pair {α β : Type u} (x : α) (y : β) : CPair α β :=
  fun z => z x y

def fst {α β : Type u} (p : CPair α β) : α :=
  p (fun x _ => x)

def snd {α β : Type u} (p : CPair α β) : β :=
  p (fun _ y => y)

def church {α β : Type u} (p : α × β) : CPair α β :=
  fun f => f p.1 p.2

def unchurch {α β : Type u} (p : CPair.{u} α β) : (α × β) :=
  p (fun a b => (a, b))

theorem fst_pair {α β : Type u} (x : α) (y : β) :
  fst (pair x y) = x
:= rfl

theorem snd_pair {α β : Type u} (x : α) (y : β) :
  snd (pair x y) = y
:= rfl

end CPair

end Church
