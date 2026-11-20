namespace Church

universe u

def COption (α : Type u) : Type (u + 1) :=
  ∀ {β : Type u}, (α → β) → β → β

namespace COption

def some {α : Type u} (a : α) : COption α :=
  fun s _ => s a

def none {α : Type u} : COption α :=
  fun _ n => n

def church {α : Type u} (o : Option α) : COption.{u} α :=
  match o with
  | Option.none   => none
  | Option.some a => some a

def unchurch {α : Type u} (o : COption.{u} α) : Option α :=
  o Option.some Option.none

end COption

end Church
