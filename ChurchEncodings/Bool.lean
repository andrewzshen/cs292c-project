namespace Church

def CBool.{u} : Type (u + 1) :=
  ∀ {α : Type u}, α → α → α

def ctrue  : CBool := fun t _ => t
def cfalse : CBool := fun _ f => f

def and (p q : CBool) : CBool := 
  fun t f => p (q t f) f  

def or (p q : CBool) : CBool := 
  fun t f => p t (q t f)  

def not (p : CBool) : CBool := 
  fun t f => p f t 

def xor : CBool := 
  sorry

def nand : CBool := 
  sorry

def implies : CBool := 
  sorry

def if' {α : Type u} (p : CBool.{u}) (t f : α) : α := 
  p t f 

end Church
