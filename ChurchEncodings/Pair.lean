namespace Church

def CPair.{u} (α β : Type u) : Type (u + 1) :=
  ∀ (γ : Type u), (α → β → γ) → γ

def cpair {α β : Type u} (x : α) (y : β) : CPair α β :=
  fun _ z => z x y

def cfst {α β : Type u} (p : CPair α β) : α := 
  p α (fun x _ => x)

def csnd {α β : Type u} (p : CPair α β) : β := 
  p β (fun _ y => y)

theorem cfst_pair {α β : Type u} (x : α) (y : β) :
  cfst (cpair x y) = x 
:= rfl

theorem csnd_pair {α β : Type u} (x : α) (y : β) :
  csnd (cpair x y) = y 
:= rfl

end Church
