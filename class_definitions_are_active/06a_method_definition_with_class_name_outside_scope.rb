class Bog
end

def Bog.monster
  Monster.instance
end

Bog.monster.prowl!